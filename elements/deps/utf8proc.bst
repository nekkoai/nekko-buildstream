kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:JuliaStrings/utf8proc
  track: master
  ref: v2.11.0-2-g231da1a15d389f4169db7e67433632141cc5d363
