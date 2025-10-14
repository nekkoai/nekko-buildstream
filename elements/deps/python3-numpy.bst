kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- base/freedesktop-sdk.bst:components/cython.bst
- deps/python3-patchelf.bst
- deps/python3-meson-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:numpy/numpy
  track: maintenance/2.3.x
  ref: v2.3.3-74-ga90f073415846b378ab166b5a2f9acf87876853b
- kind: git_module
  path: doc/source/_static/scipy-mathjax
  url: github:scipy/scipy-mathjax
  ref: 36f4c898f2255e0c98eb6949cd67381552d5ffea
- kind: git_module
  path: numpy/_core/src/common/pythoncapi-compat
  url: github:python/pythoncapi-compat
  ref: 90c06a4cae557bdbfa4f231a781d2b5c1a8f6d1c
- kind: git_module
  path: numpy/_core/src/highway
  url: github:google/highway
  ref: 37c08e5528f63ead9c7e4fd99ba454c1b1a3e3f7
- kind: git_module
  path: numpy/_core/src/npysort/x86-simd-sort
  url: github:intel/x86-simd-sort
  ref: 6a7a01da4b0dfde108aa626a2364c954e2c50fe1
- kind: git_module
  path: numpy/_core/src/umath/svml
  url: github:numpy/SVML
  ref: 3a713b13018325451c1b939d3914ceff5ec68e19
- kind: git_module
  path: numpy/fft/pocketfft
  url: github:mreineck/pocketfft
  ref: 33ae5dc94c9cdc7f1c78346504a85de87cadaa12
- kind: git_module
  path: vendored-meson/meson
  url: github:numpy/meson
  ref: e72c717199fa18d34020c7c97f9de3f388c5e055
