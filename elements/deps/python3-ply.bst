kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:dabeaz/ply
  track: 3.11
  ref: 0f398b72618c1564d71f7dc0558e6722b241875a
