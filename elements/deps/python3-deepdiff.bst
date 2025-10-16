kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-orderly-set.bst

sources:
- kind: git_repo
  url: github:seperman/deepdiff
  track: master
  ref: 8.6.1-0-g60ac5b903dbd662e0e83bf7b481df97d42f693df
