kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/fxdiv.bst

depends:
- deps/fxdiv.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D PTHREADPOOL_BUILD_TESTS=OFF
    -D PTHREADPOOL_BUILD_BENCHMARKS=OFF
    -D PTHREADPOOL_USE_SYSTEM_LIBS=ON
    -D PTHREADPOOL_LIBRARY_TYPE=shared

sources:
- kind: git
  url: github:Maratyszcza/pthreadpool
  track: master
  ref: 560c60d342a76076f0557a3946924c6478470044
- kind: patch
  path: static/patches/pthreadpool-cmake.patch
