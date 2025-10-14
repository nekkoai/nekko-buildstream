kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- base/freedesktop-sdk.bst:components/cython.bst
- deps/python3-meson-python.bst
- deps/python3-patchelf.bst
- deps/boost.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-pythran.bst
- deps/python3-numpy.bst
- deps/pybind.bst
- deps/python3-pybind.bst
- deps/openblas.bst
- deps/xsimd.bst

sources:
- kind: git_repo
  url: github:scipy/scipy
  track: maintenance/1.16.x
  ref: v1.16.2-8-g6cf871b7736f652aa097a9ff8979965a72ca0ee1
- kind: git_module
  path: subprojects/highs
  url: github:scipy/HiGHs
  ref: 222cce79a2bca866dbfbcd91b55da11336ae88f4
- kind: git_module
  path: subprojects/boost_math/math
  url: github:boostorg/math
  ref: 529f3a759d83aa9437613666ea6293c9336d4069
- kind: git_module
  path: subprojects/xsf
  url: github:scipy/xsf
  ref: 4fff9b2cb2b5c31a0cf0b0f609d2699a5eeac53b
- kind: git_module
  path: doc/source/_static/scipy-mathjax
  url: github:scipy/scipy-mathjax
  ref: 3d21c58225c09243d5a088b1557654d280925e02
- kind: git_module
  path: scipy/sparse/linalg/_propack/PROPACK
  url: github:scipy/PROPACK
  ref: 8a6b20767d74fe560d616d51e83e35b01bce6861
- kind: git_module
  path: scipy/_lib/unuran
  url: github:scipy/unuran
  ref: 21810c856880bb2f1b3071c8ac4aaf634983b338
- kind: git_module
  path: scipy/_lib/array_api_compat
  url: github:data-apis/array-api-compat
  ref: 8005d6d02c0f1717881de37a710871bb955eb5cd
- kind: git_module
  path: scipy/_lib/pocketfft
  url: github:scipy/pocketfft
  ref: 9367142748fcc9696a1c9e5a99b76ed9897c9daa
- kind: git_module
  path: scipy/_lib/cobyqa
  url: github:cobyqa/cobyqa
  ref: 55c8e5a5d29ba5c873d87ad27bd9cffee94ae3df
- kind: git_module
  path: scipy/_lib/array_api_extra
  url: github:data-apis/array-api-extra
  ref: 28a364d961dfe506877bd111f9d4e503a9fafa16
