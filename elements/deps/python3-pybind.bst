kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/python3-scikit-build-core.bst

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
