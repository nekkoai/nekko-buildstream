kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BACKWARD_SHARED=on

sources:
- kind: git
  url: github:bombela/backward-cpp
  track: master
  ref: 0bfd0a07a61551413ccd2ab9a9099af3bad40681
