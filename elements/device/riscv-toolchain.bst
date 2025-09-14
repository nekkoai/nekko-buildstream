kind: import

depends:
- device/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Use a local source to stage our file
#- kind: tar
#path: static/et-gnu-toolchain-0.1.0.tar.gz
sources:
- kind: local
  path: static/gnu

config:
  target: /opt/toolchain/gnu
