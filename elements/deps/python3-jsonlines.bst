kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-attrs.bst

sources:
- kind: git_repo
  url: github:wbolster/jsonlines
  track: master
  ref: 4.0.0-1-g43d1a30b9634f8b715b6af3f2473927caa1e704d
