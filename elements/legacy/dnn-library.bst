kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/et-common-libs.bst

# TODO While this is in legacy/ namespace, it needs the device toolchain and will end up in platform
variables:
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
   -D ENABLE_WARNINGS_AS_ERRORS=off

sources:
- kind: git
  url: github:nekkoai/dnn-library
  track: main
  ref: d4e7de30f299798f0b30340865edd00888380752
- kind: patch
  path: static/patches/platformsw-dnn-library.patch
