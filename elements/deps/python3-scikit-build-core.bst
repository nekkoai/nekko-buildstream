kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-hatchling.bst
- base/freedesktop-sdk.bst:components/stripper.bst

depends:
- base/freedesktop-sdk.bst:components/python3-installer.bst

#variables:
#  version: '$(git describe --abbrev=7 | sed "s/^v//")'

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.11.6"

sources:
- kind: git
  url: github:scikit-build/scikit-build-core
  track: main
  ref: 326490975510b2af888e0f319292fc4a9084a033
