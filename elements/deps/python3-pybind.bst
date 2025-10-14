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
- kind: git_repo
  url: github:pybind/pybind11
  track: v3.0.1
  ref: v3.0.1-0-gf5fbe867d2d26e4a0a9177a51f6e568868ad3dc8
