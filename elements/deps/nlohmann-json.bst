kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DJSON_BuildTests=OFF

sources:
- kind: git
  url: github:nlohmann/json.git
  track: v*
  ref: v3.12.0-0-g55f93686c01528224f448c19128836e7df245f72
