kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-gast.bst
- deps/python3-beniget.bst
- deps/python3-ply.bst
- deps/python3-numpy.bst

sources:
- kind: git
  url: github:serge-sans-paille/pythran
  track: 0.18.0
  ref: 7f2a83af676850fd5e3305d82ad420d8b9dfca1c
