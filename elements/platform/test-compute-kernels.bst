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
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
