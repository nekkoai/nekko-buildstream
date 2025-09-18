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
- kind: git
  url: github:numpy/numpy
  submodules:
    doc/source/_static/scipy-mathjax:
      url: github:scipy/scipy-mathjax
      checkout: True
    numpy/_core/src/common/pythoncapi-compat:
      url: github:python/pythoncapi-compat
      checkout: True
    numpy/_core/src/highway:
      url: github:google/highway
      checkout: True
    numpy/_core/src/npysort/x86-simd-sort:
      url: github:intel/x86-simd-sort
      checkout: True
    numpy/_core/src/umath/svml:
      url: github:numpy/SVML
      checkout: True
    numpy/fft/pocketfft:
      url: github:mreineck/pocketfft
      checkout: True
    vendored-meson/meson:
      url: github:numpy/meson
      checkout: True
  track: maintenance/2.3.x
  ref: 441262af28d48b160315126f7c08feaea58699c3
