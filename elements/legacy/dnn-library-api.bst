kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- legacy/dnn-library.bst

depends:
- legacy/dnn-library.bst

variables:
  (@):
  - include/_private/legacy-toolchain.yml

sources:
- kind: git_repo
  url: github:nekkoai/dnn-library-api
  track: master
  ref: 7e5374be6c660b6db79b68c96ee5bdf0d65a5ed1
