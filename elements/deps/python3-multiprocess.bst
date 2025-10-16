kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:uqfoundation/multiprocess
  track: master
  ref: 0.70.18-13-g9c222e503ba914f4bbd71bcce3603ec92d027f0b
