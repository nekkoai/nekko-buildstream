kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git
  url: github:google/googletest
  track: main
  ref: 4969d0ad540da8fc9944e99457361dc7e35943c2
