kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:mrabarnett/mrab-regex
  track: hg
  ref: 4359a6a565e6725a899a4e1179c75fdad09030ae
