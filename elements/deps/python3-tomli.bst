kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:hukkin/tomli
  track: "*.*.*"
  ref: 2.3.0-0-g3fccd16450d0f1d87c042473d95a07f60955206e
