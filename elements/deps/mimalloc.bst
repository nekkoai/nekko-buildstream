kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D MI_BUILD_TESTS=OFF

sources:
- kind: git_repo
  url: github:microsoft/mimalloc
  track: main
  ref: v2.2.4-7-g09a27098aa6e9286518bd9c74e6ffa7199c3f04e
