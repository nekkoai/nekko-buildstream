kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:python-versioneer/python-versioneer
  track: master
  ref: 0.29-45-gc810b1546ea5e9260bdb0235b69235bf900b6627
