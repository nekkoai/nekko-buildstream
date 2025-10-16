kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:python/mypy_extensions
  track: master
  ref: 9fc7fe08c8e638cdd9bbf1aa9bf188aef4fd24ef
