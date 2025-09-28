kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- legacy/dnn-library.bst

depends:
- legacy/dnn-library.bst

variables:
  command-subdir: dnn-library-api
  (@):
  - include/_private/legacy-toolchain.yml

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
