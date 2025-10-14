kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/abseil-cpp.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:google/re2
  track: main
  ref: 6569a9a3df256f4c0c3813cb8ee2f8eef6e2c1fb
