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
    push: false
  - url: http://localhost:60052
    push: true
EOF

RUN mv /tmp/buildstream.conf $HOME/.config/buildstream.conf
RUN ln -s $(python3 -c "import site; print(site.getsitepackages()[0])")/buildstream/subprojects/buildbox/buildbox-casd /usr/local/bin/buildbox-casd
RUN \
    --security=insecure \
    --mount=type=bind,from=casdcache,source=/,target=/casd-cache,readwrite \
    --mount=type=cache,target=/cache \
    --mount=type=cache,target=/src/nekko/.bst \
    /usr/local/bin/buildbox-casd --bind localhost:60051 /casd-cache & \    
    /usr/local/bin/buildbox-casd --bind localhost:60052 /casd-cache-new & \    
    bst build nekko-legacy.bst && \
    mkdir /out && \
    bst artifact checkout nekko-legacy.bst --directory /out

RUN rm -rf /casd-cache

FROM scratch AS artifact-pushed
COPY --from=build /casd-cache-new /

# final image
FROM scratch
COPY --from=build /out/ /
