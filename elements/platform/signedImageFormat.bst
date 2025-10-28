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
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
