kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:hynek/hatch-fancy-pypi-readme
  track: 25.1.0
  ref: 8d7b82ce008390d7725c32e064aed8be26ab1cac
