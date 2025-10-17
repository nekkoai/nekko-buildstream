kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:Farama-Foundation/Farama-Notifications
  track: main
  ref: 0.0.4-3-gc3368e203d98b305a985799f80b6e4a89185ae3d
