kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/boost.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
      
sources:
- kind: git
  url: github:pybind/pybind11
  track: master
  ref: 326b10637a9fe2d1c9f290b6e052097ffc2413c3
