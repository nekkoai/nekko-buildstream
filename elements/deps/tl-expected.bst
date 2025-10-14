kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D EXPECTED_BUILD_TESTS=off

sources:
- kind: git_repo
  url: github:TartanLlama/expected
  track: master
  ref: 1770e3559f2f6ea4a5fb4f577ad22aeb30fbd8e4
