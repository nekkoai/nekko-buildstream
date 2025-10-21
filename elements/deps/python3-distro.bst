kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:python-distro/distro
  track: master
  ref: v1.9.0-2-g3bd19e61fcb7f8d2bf3d45d9e40d69c92e05d241
