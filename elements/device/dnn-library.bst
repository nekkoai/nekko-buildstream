kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- device/et-common-libs.bst

variables:
  command-subdir: device/dnn-library
  (@):
  - include/_private/device-toolchain.yml
  cmake-local: >-
   -D ENABLE_WARNINGS_AS_ERRORS=off


sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
