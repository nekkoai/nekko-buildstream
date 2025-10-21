kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:leethomason/tinyxml2
  track: master
  ref: 11.0.0-10-g36ff404c346acadd8a42c135f096ebd5437610b1
