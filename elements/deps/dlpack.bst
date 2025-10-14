kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

sources:
- kind: git_repo
  url: github:dmlc/dlpack
  track: main
  ref: addbc8b3d9449691d01827ac4a0e0d035cf8ea40
