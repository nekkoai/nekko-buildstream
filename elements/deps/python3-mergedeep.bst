kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:clarketm/mergedeep
  track: master
  ref: v1.3.4-2-gb52fae95fb612a75c57182706294a26c81698621
