kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-hatch-fancy-pypi-readme.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:encode/httpx
  track: master
  ref: 0.28.1-21-gdef4778d622e8bf49a9fea4dda78cca4cf666d8a
