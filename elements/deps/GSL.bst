kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D GSL_TEST=OFF

sources:
- kind: git
  url: github:microsoft/GSL
  track: main
  ref: 7e0943d20d3082b4f350a7e0c3088d2388e934de
