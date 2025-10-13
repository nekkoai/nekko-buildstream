kind: manual

depends:
- toolchain/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Fetch the precompiled compiler binaries
#
# This URL should be available via the tailnet - otherwise, extract it to static/gnu and switch to local
#
# This tar file was created on an Ubuntu 24.04 image with:
#
# ./configure --prefix=/home/ubuntu/work/et-gnu-toolchain
#     --with-arch=rv64imfc --with-abi=lp64f --with-languages=c,c++ --with-cmodel=medany --enable-strip
#
# url: github:nekkoai/et-riscv-gnu-toolchain
# track: et
# ref: 156d6982189fa294a6cbad10b8a0a28fb581acaf
#
# url: http://cassian/dist/et-gnu-toolchain-0.2.0.tar.gz
# ref: 3d7cb577ca34c8ba6d2e467bfd0c90de1730cb48be2e8133453fdb4d7697df9c
#
# url: http://cassian/dist/et-gnu-toolchain-0.3.0.tar.gz
# ref: ba187ad49f8e996029504365ac18ae9d9ea7a6c06cd43d1016eb603176cf95ab
#
#- kind: local
#  path: static/gnu

variables:
  repo: nekkoai/et-riscv-gnu-toolchain
  asset_name: et-riscv-gnu-toolchain.tar.gz
  version: v0.3.0
  digest: d46da71b47cfd129fa693e545d7e06fab83543a8337f5aadcef046ebb296abb5

sources: []

config:
  build-commands:
  - |
    set -eux

    # Ensure GITHUB_TOKEN is available
    if [ -z "${GITHUB_TOKEN:-}" ]; then
      echo "ERROR: GITHUB_TOKEN is not set. Please export a fine-grained token." >&2
      exit 1
    fi

    # Get the latest release tag (e.g., v0.3.0)
    latest_tag=$(curl -s -H "Authorization: Bearer ${GITHUB_TOKEN}" \
      "https://api.github.com/repos/%{repo}/releases/%{version}" | \
      jq -r '.tag_name')

    echo "Latest release tag: ${latest_tag}"

    # Find asset ID for the requested file
    asset_id=$(curl -s -H "Authorization: Bearer ${GITHUB_TOKEN}" \
      "https://api.github.com/repos/%{repo}/releases/tags/${latest_tag}" | \
      jq -r --arg name "%{asset_name}" '.assets[] | select(.name == $name) | .id')

    if [ -z "${asset_id}" ]; then
      echo "ERROR: Could not find asset named '%{asset_name}' in release ${latest_tag}" >&2
      exit 1
    fi

    echo "Downloading asset ID ${asset_id}"

    # Download the release asset securely
    curl -L \
      -H "Authorization: Bearer ${GITHUB_TOKEN}" \
      -H "Accept: application/octet-stream" \
      -o toolchain.tar.gz \
      "https://api.github.com/repos/%{repo}/releases/assets/${asset_id}"

    # Verify integrity if desired (add sha256sum here if you keep it known)
    actual=$(sha256sum toolchain.tar.gz | awk '{print $1}')
    if [ "$actual" != "%{digest}" ]; then
       echo "Checksums do not match, actual $actual vs expected %{digest}"
       exit 1
    fi
    tar -xf toolchain.tar.gz

    mkdir -p %{install-root}/opt/toolchain
    cp -a ./* %{install-root}/opt/toolchain/
