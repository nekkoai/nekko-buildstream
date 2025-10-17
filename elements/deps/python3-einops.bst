kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:arogozhnikov/einops
  track: main
  ref: v0.8.1-6-g361b11e87da94ead4bd09de636c5dbed73e0e3e0
