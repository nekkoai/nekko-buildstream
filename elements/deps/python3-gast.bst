kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:serge-sans-paille/gast
  track: 0.6.0
  ref: 20113b4a6a26ca237a3b1a44a92d73108f4a8dd8
