kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/et-trace.bst
- platform/etsoc-hal.bst

depends:
- platform/et-trace.bst
- platform/etsoc-hal.bst

variables:
  command-subdir: et-common-libs
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
    -D ENABLE_WARNINGS_AS_ERRORS=OFF

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
- kind: patch
  path: static/patches/platformsw-et-common-libs-tensors.patch
