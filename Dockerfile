# syntax=docker/dockerfile:1.19-labs
FROM ubuntu:24.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y bubblewrap lzip apparmor-profiles git gcc python3 python3-venv python3-dev
# Setup apparmor for bubblewrap
RUN ln -s /usr/share/apparmor/extra-profiles/bwrap-userns-restrict /etc/apparmor.d/

# setup python virtual environment for buildstream
RUN python3 -m venv /opt/venv
# ensure all future calls use the venv
ENV PATH="/opt/venv/bin:$PATH"

# dulwich *must* be 0.24.0, because later versions, including v0.24.1 etc., have a change that
# break buildstream-plugins support
RUN pip install buildstream buildstream-plugins dulwich==0.24.0 tomlkit requests && \
    pip uninstall click -y && \
    pip install 'click<8.1'   # compatibility issue with buildstream


COPY . /src/nutcracker

WORKDIR /src/nutcracker

# ensure that hostchecking is not done otherwise it will block
ENV GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"

# consolidate caches
ENV XDG_CACHE_HOME=/cache

# run build and export the artifact as a directory
RUN \
    --security=insecure \
    --mount=type=ssh \
    --mount=type=secret,id=git_config,target=/root/.gitconfig \
    --mount=type=secret,id=git_credentials,target=/root/.git-credentials \
    --mount=type=cache,target=/cache \
    --mount=type=cache,target=/src/nutcracker/.bst \
    bst build nutcracker-legacy.bst && \
    mkdir /out && \
    bst artifact checkout nutcracker-legacy.bst --directory /out

# final image
FROM scratch
COPY --from=build /out/ /
