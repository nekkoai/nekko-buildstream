kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- base/freedesktop-sdk.bst:components/cython.bst
- deps/python3-meson-python.bst
- deps/python3-patchelf.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-pythran.bst
- deps/python3-numpy.bst
- deps/pybind.bst
- deps/python3-pybind.bst
- deps/openblas.bst

sources:
- kind: git
  url: github:scipy/scipy
  track: maintenance/1.16.x
  ref: 811f230b9a18897bba753e0be3b3515342c7d6bf
