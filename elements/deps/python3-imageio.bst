kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst
- deps/python3-pillow.bst

sources:
- kind: git_repo
  url: github:imageio/imageio
  track: master
  ref: v2.37.0-9-g013582acfce692428d8100bb54f407dc8b43ccbb
