kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:matplotlib/cycler
  track: main
  ref: v0.12.1-11-gd1737eb0a42bd451e8770cef245ebe60ebb36bfc
