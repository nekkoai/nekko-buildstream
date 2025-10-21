kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:pyparsing/pyparsing
  track: master
  ref: 3.3.0a1-1-gcd081ef1ab6e1a586a90603500af7e635619c7c5
