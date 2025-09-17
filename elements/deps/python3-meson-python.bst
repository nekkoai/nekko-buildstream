kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
#public-stacks/buildsystem-python-setuptools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- deps/python3-patchelf.bst

depends:
- base/freedesktop-sdk.bst:components/meson.bst
- deps/python3-pyproject-metadata.bst

sources:
- kind: git
  url: github:mesonbuild/meson-python
  track: main
  ref: 8d50078e2c6134c058169b4df692e990174b8553
