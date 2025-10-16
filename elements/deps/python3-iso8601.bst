kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:micktwomey/pyiso8601
  track: main
  ref: 2.1.0-2-g00c9262b9ad141f287b3263be7f2244fa01988c2
