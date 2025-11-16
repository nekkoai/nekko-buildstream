# syntax=docker/dockerfile:1.19-labs
ARG CACHE_IMAGE=ghcr.io/nekkoai/nekko-buildstream-cache:latest
FROM ${CACHE_IMAGE} AS casdcache
FROM ubuntu:24.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y bubblewrap lzip apparmor-profiles git gcc python3 python3-venv python3-dev
# Setup apparmor for bubblewrap
RUN ln -s /usr/share/apparmor/extra-profiles/bwrap-userns-restrict /etc/apparmor.d/

# setup python virtual environment for buildstream
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
# ensure all future calls use the venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# dulwich *must* be 0.24.0, because later versions, including v0.24.1 etc., have a change that
# break buildstream-plugins support
RUN pip install buildstream buildstream-plugins dulwich==0.24.0 tomlkit requests && \
    pip uninstall click -y && \
    pip install 'click<8.1'   # compatibility issue with buildstream

COPY . /src/nekko

WORKDIR /src/nekko

# consolidate caches for local files; does not affect casd
ENV XDG_CACHE_HOME=/cache

# run build and export the artifact as a directory

RUN mkdir -p $HOME/.config
COPY <<EOF /tmp/buildstream.conf
artifacts:
  override-project-caches: false
  servers:
  - url: http://localhost:60051
EOF

RUN \
    --security=insecure \
    --mount=type=cache,target=/cache \
    --mount=type=cache,target=/src/nekko/.bst \
    --mount=type=cache,id=casd-cache,target=/casd-cache \
    --mount=from=casdcache,source=/,target=/casd-cache \
    mv /tmp/buildstream.conf $HOME/.config/buildstream.conf && \
    $(python3 -c "import site; print(site.getsitepackages()[0])")/buildstream/subprojects/buildbox/buildbox-casd --bind localhost:60051 /casd-cache & \
    bst build nekko-legacy.bst && \
    mkdir /out && \
    bst artifact checkout nekko-legacy.bst --directory /out

# final image
FROM scratch
COPY --from=build /out/ /
