kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:uqfoundation/dill
  track: master
  ref: 0.4.0-7-gf77f84b5311be259bf0577f949d93471df332cb2
