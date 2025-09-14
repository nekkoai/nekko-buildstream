kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/boost.bst

variables:
  cmake-local: >-
    -D WITH_WERROR=off
    -D BUILD_DOC=off
    -D BUILD_TESTS=off

sources:
- kind: git
  url: github:USCiLab/cereal
  track: master
  ref: a56bad8bbb770ee266e930c95d37fff2a5be7fea
