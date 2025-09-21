kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:mpmath/mpmath
  track: 1.3.0
  ref: b5c04506ef0cd4a1f1213f8389ee21c9c3551582
