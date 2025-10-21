kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:tinyobjloader/tinyobjloader
  track: release
  ref: v2.0.0rc13-9-ga4e519b0a0f29c790464fcfeadfe25a7f9fa15ff
