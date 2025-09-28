kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D BUILD_SHARED_LIBS=on

sources:
- kind: git
  url: github:google/double-conversion
  track: master
  ref: 11bbdb58fb10858bb546ca445481199faff2f585
