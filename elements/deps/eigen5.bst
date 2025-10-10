kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D EIGEN_BUILD_TESTING=off
    -D EIGEN_BUILD_BLAS=off
    -D EIGEN_BUILD_LAPACK=off

sources:
- kind: git
  url: gitlab:libeigen/eigen
  track: master
  ref: eea6587b0e9faa56e425001607c225647f760caf
- kind: patch
  path: static/patches/eigen-blas-lapack-cmake.patch
