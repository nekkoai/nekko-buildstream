kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git
  url: github:google/re2
  track: main
  ref: 6569a9a3df256f4c0c3813cb8ee2f8eef6e2c1fb
