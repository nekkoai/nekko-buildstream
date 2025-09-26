FROM ubuntu:24.04 AS build

COPY . /src/nutcracker-legacy

WORKDIR /src/nutcracker-legacy

# install packages
RUN apt-get update -y && apt-get install -y bubblewrap lzip apparmor-profiles
# Setup apparmor for bubblewrap
RUN ln -s /usr/share/apparmor/extra-profiles/bwrap-userns-restrict /etc/apparmor.d/ && systemctl reload apparmor

# connect to tailnet
RUN curl -fsSL https://pkgs.tailscale.com/stable/debian/stable.gpg | gpg --dearmor -o /usr/share/keyrings/tailscale-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/tailscale-archive-keyring.gpg] https://pkgs.tailscale.com/stable/debian stable main" | tee /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && \
    apt-get install -y tailscale --no-install-recommends

# setup environment for buildstream
RUN python -m venv myenv && \
    source myenv/bin/activate && \
    pip install buildstream buildstream-plugins dulwich tomlkit

# run build with tailscale
RUN --mount=type=secret,id=tsauth-key,env=TS_AUTHKEY tailscaled && \
    sleep 3 && \
    tailscale up --authkey=$TS_AUTHKEY --hostname=docker-build-node --advertise-exit-node=false --accept-routes=false && \
    source myenv/bin/activate && \
    bst build nutcracker-legacy.bst

# export the image requirements
RUN source myenv/bin/activate && \
    mkdir /out && \
    bst artifact checkout nutcracker-legacy.bst --directory /out

# final image
FROM scratch
COPY --from=build /out/ /
