kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BENCHMARK_ENABLE_WERROR=OFF
    -D BENCHMARK_ENABLE_TESTING=OFF

sources:
- kind: git
  url: github:google/benchmark
  track: main
  ref: b2959a733d26ca5f0c2a765069d8ae37f7b03fd8
