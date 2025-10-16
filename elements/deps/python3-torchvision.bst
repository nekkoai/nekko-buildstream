kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-jinja2.bst
- base/freedesktop-sdk.bst:components/python3-filelock.bst
- base/freedesktop-sdk.bst:components/python3-networkx.bst
- deps/python3-torch.bst
- deps/python3-sympy.bst
- deps/python3-fsspec.bst

sources:
- kind: git_repo
  url: github:pytorch/vision
  track: v0.24.0
  ref: v0.24.0-0-g7a9db90e9aadea3e3e1fec35969601167e9efd4f
