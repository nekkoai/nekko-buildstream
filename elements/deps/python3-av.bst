kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/cython.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/ffmpeg.bst

sources:
- kind: git_repo
  url: github:PyAV-Org/PyAV
  track: main
  ref: v16.0.1-0-g7687256d87f22f78cb75bb4aba94dc6e504c9983
