kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/python3.bst
- toolchain/riscv-toolchain.bst
- platform/platformsw-cmake.bst
- platform/et-common-libs.bst
- platform/et-trace.bst
- platform/etsoc-hal.bst
- platform/devicelayer.bst

variables:
  command-subdir: test-compute-kernels
  (@):
  - include/_private/platform-device-toolchain.yml

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
