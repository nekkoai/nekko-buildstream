kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CAPSTONE_BUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:capstone-engine/capstone
  track: next
  ref: 6.0.0-Alpha5-27-gc059126d98837a1c4f6988756fe30fc10904f6a6
