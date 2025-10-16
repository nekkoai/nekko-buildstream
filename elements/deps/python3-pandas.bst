kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-meson.bst
- base/freedesktop-sdk.bst:components/cython.bst
- deps/python3-meson-python.bst
- deps/python3-patchelf.bst
- deps/python3-versioneer.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/tzdata.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-pytz.bst
- deps/python3-numpy.bst
- deps/python3-dateutil.bst

sources:
- kind: git_repo
  url: github:pandas-dev/pandas
  track: 2.3.x
  ref: v2.3.3-1-g5fc3df37d772befbdba7cc2bd3e9ce572fe607c0
