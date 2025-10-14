kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst
- deps/onnx.bst
- deps/python3-ml_dtypes.bst

sources:
- kind: git_repo
  url: github:onnx/ir-py
  track: v0.1.10
  ref: e657840b8ed9c0d6a54008ec77ed2aa50bfabeab
