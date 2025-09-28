kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- deps/pthreadpool.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CPUINFO_BUILD_UNIT_TESTS=OFF
    -D CPUINFO_BUILD_MOCK_TESTS=OFF
    -D CPUINFO_BUILD_BENCHMARKS=OFF
    -D USE_SYSTEM_LIBS=ON
    -D CPUINFO_LIBRARY_TYPE=shared

sources:
- kind: git
  url: github:pytorch/cpuinfo
  track: main
  ref: 877328f188a3c7d1fa855871a278eb48d530c4c0
