kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:substrait-io/substrait
  track: main
  ref: v0.77.0-1-gb958843bc5cc0df49e99456eea8c9f5391f66636
