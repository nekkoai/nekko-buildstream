kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:nucleic/cppy
  track: main
  ref: 1.3.1-21-ga0815c45bd193c97b45b3b540415117589735a2b
