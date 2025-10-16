kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON
    -D SNAPPY_BUILD_TESTS=OFF
    -D SNAPPY_BUILD_BENCHMARKS=OFF

sources:
- kind: git_repo
  url: github:google/snappy
  track: main
  ref: 1.2.2-4-g6f99459b5b837fa18abb1be317d3ac868530f384
