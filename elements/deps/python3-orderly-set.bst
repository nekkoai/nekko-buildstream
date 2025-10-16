kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:seperman/orderly-set
  track: master
  ref: 5.5.0-0-g897f0f289b49b0a4a0ed9ad2b47ff71bbdd6a2e4
