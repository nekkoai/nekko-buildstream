kind: import

depends:
- device/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Fetch the precompiled compiler binaries
# This URL should be available via the tailnet - otherwise, extract it to static/gnu and switch to local
sources:
#- kind: local
#  path: static/gnu
- kind: tar
  url: http://cassian/dist/et-gnu-toolchain-0.1.0.tar.gz

  ref: f4bd60fb4bf1f8c40ccf444e7a774d3ec7258c00d6311b34de170ee99ab8b44f
config:
  target: /opt/toolchain/gnu
