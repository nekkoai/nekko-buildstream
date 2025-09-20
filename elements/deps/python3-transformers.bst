kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git
  url: github:huggingface/transformers
  track: main
  ref: 022c882e1432af66ef55337b5c91ad2d838365ca
