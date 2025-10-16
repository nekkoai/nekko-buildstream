kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:PythonCharmers/python-future
  track: master
  ref: v1.0.0-2-g2d56f83adab5a0957cfc5abbe62db1e2d1912b61
