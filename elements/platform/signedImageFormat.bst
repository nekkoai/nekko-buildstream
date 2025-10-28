kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst

variables:
  command-subdir: signedImageFormat
  (@):
  - include/_private/platform-device-toolchain.yml

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
