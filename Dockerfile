FROM ubuntu:24.04 AS build

COPY . /src/nutcracker-legacy

WORKDIR /src/nutcracker-legacy


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y bubblewrap lzip apparmor-profiles git gcc python3 python3-venv python3-dev
# Setup apparmor for bubblewrap
RUN ln -s /usr/share/apparmor/extra-profiles/bwrap-userns-restrict /etc/apparmor.d/ && systemctl reload apparmor

# setup environment for buildstream
RUN python3 -m venv myenv && \
    source myenv/bin/activate && \
    pip install buildstream buildstream-plugins dulwich tomlkit requests && \
    pip uninstall click -y && \
    pip install 'click<8.1'   # compatibility issue with buildstream

# run build and export the artifact as a directory
RUN source myenv/bin/activate && \
    bst build nutcracker-legacy.bst && \
    mkdir /out && \
    bst artifact checkout nutcracker-legacy.bst --directory /out

# final image
FROM scratch
COPY --from=build /out/ /
