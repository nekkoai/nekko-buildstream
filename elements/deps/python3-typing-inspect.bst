kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:ilevkivskyi/typing_inspect
  track: master
  ref: 0.9.0-7-g5bc59c615e9d8619d876d738f2e4096ad5171336
