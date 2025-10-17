kind: import

depends:
- toolchain/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Fetch the precompiled compiler binaries on GitHub
# https://github.com/aifoundry-org/riscv-gnu-toolchain
sources:
- kind: tar
  url: https://github.com/aifoundry-org/riscv-gnu-toolchain/releases/download/2025.10.15/riscv64-elf-ubuntu-24.04-gcc-nightly-2025.10.15-nightly.tar.xz
  ref: 6bd5b965a03d402dead46b964995a7f50dcc2ba65c263996547d62371ac22704
config:
  target: /opt/toolchain/gnu
