kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/ninja.bst
- deps/python3-scikit-build-core.bst

depends:
- deps/python3-scikit-build-core.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.17.2.4"

sources:
- kind: git
  url: github:mayeut/patchelf-pypi
  track: main
  ref: a36233f5acb4c6332d567f73deb3faf6ecec9ac9
