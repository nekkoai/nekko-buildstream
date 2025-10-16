kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:marin-community/draccus
  track: main
  ref: releases/0.4.0-63-g13dd58f0c67002add8a188d85ba0e74661039078
