kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- device/et-common-libs.bst
- device/dnn-library.bst

variables:
  command-subdir: device/gp-sdk/device
  (@):
  - include/_private/device-toolchain.yml
  cmake-local: >-
    -D CMAKE_COMPILE_WARNING_AS_ERROR=off
    -D ET_SDK_HOME=%{prefix}
    -D DEV_COMPILER=gcc8.2
    -D ADDRESS:STRING=0x8006335000
    -D BUILD_TESTS=no
    -D BUILD_DOCS=no

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
#- kind: patch
#path: static/patches/gpsdk-cmake-noenv.patch
