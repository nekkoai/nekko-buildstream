kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst

variables:
  command-subdir: libkineto
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D KINETO_BUILD_TESTS=OFF
    -D KINETO_LIBRARY_TYPE=shared

sources:
- kind: git
  url: github:pytorch/kineto
  track: main
  ref: 29a3485103287727ac3fb11954bb976f6ea11e69
- kind: patch
  path: static/patches/kineto-cmake.patch
