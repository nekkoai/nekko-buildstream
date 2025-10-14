kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:simonpercivall/astunparse
  track: main
  ref: 2acce01fcdda2ea32eea835c30ccca21aaff7297
