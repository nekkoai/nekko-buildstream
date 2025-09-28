kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/et-common-libs.bst

# TODO While this is in legacy/ namespace, it needs the device toolchain and will end up in platform
variables:
  command-subdir: device/dnn-library
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
   -D ENABLE_WARNINGS_AS_ERRORS=off

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
- kind: patch
  path: static/patches/platformsw-dnn-library.patch
