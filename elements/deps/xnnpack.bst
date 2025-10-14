kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/python3.bst

depends:
- deps/cpuinfo.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D XNNPACK_BUILD_TESTS=OFF
    -D XNNPACK_BUILD_BENCHMARKS=OFF
    -D XNNPACK_USE_SYSTEM_LIBS=ON
    -D XNNPACK_LIBRARY_TYPE=shared

sources:
- kind: git_repo
  url: github:google/xnnpack
  track: master
  ref: 51a0103656eff6fc9bfd39a4597923c4b542c883
- kind: patch
  path: static/patches/xnnpack-cmake.patch
