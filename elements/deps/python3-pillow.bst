kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/jpeg.bst
- deps/python3-pybind.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow
  track: main
  ref: 9e4256e8aa9d7adad4271069732c48d129d5b38f
