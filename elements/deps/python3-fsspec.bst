kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:fsspec/filesystem_spec
  track: master
  ref: 2025.9.0-11-g43e60fa13067349708b72b4af3adacfa6558660e
