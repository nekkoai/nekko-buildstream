kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:Tencent/rapidjson
  track: master
  ref: v1.1.0-763-g24b5e7a8b27f42fa16b96fc70aade9106cf7102f
