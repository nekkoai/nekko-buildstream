kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:abseil/abseil-py
  track: main
  ref: v2.3.1-5-g0ae13d26523db94c9e4f8571b27bdc1d9918a004
