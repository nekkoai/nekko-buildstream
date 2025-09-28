kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.9.0"

sources:
- kind: git
  url: github:astanin/python-tabulate
  track: master
  ref: 74885be915e2ac611585f5398f23c402532c1059
