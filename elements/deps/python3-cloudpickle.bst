kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:cloudpipe/cloudpickle
  track: master
  ref: v3.1.1-5-ge8bbedee5dacb20346a33bdac4393bafdb9793d9
