kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-cppy.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:nucleic/kiwi
  track: main
  ref: 1.4.9-1-gb84cf28d1f6efa8a4c7d17fcba2bdcb6c64cfa5e
