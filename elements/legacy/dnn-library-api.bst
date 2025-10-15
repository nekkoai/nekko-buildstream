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
  ref: 2df327a353248769ef44229b2b7e847a6dc24c1a
