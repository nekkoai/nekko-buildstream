kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- base/freedesktop-sdk.bst:components/python3-flit-core.bst
- base/freedesktop-sdk.bst:components/python3-installer.bst

sources:
- kind: git_repo
  url: github:pypa/pyproject-metadata
  track: main
  ref: 14ebed1cc4ef746ed514ca2b15acd51878ab10eb
