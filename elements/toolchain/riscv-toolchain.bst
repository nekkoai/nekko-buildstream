kind: manual

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- toolchain/riscv-toolchain-cmake.bst
- deps/mpc.bst

variables:
  prefix: /opt/toolchain/gnu

config:
  install-commands:
  - |
    mkdir -p "%{install-root}%{prefix}"
    cp -rp * "%{install-root}%{prefix}"
  - |
    %{install-extra}

  strip-commands:
  - |
    %{strip-binaries}

# Fetch the precompiled compiler binaries on GitHub
# https://github.com/aifoundry-org/riscv-gnu-toolchain
sources:
- kind: tar
  url: https://github.com/aifoundry-org/riscv-gnu-toolchain/releases/download/2025.11.02/riscv64-elf-ubuntu-24.04-gcc.tar.xz
  ref: ad50bd6d74e5f6b84b246626a7226bc30bae42a0969655c111f62cb7fedf64da
