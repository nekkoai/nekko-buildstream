kind: import

depends:
- toolchain/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Fetch the precompiled compiler binaries on GitHub
# https://github.com/aifoundry-org/riscv-gnu-toolchain
sources:
- kind: tar
  url: https://github.com/aifoundry-org/riscv-gnu-toolchain/releases/download/2025.12.02/riscv64-elf-ubuntu-24.04-gcc-stripped.tar.xz
  ref: 763e4375fcbc18908942dde9de6dc42bbca12d3b6fbe41f5366141bc69b571b9
config:
  target: /opt/toolchain/gnu
