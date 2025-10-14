kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:benjaminp/six
  track: main
  ref: 7d2a0e96602b83cd082896c8c224a87f1efe2111
