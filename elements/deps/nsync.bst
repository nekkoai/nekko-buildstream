kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
      
sources:
- kind: git
  url: github:google/nsync
  track: master
  ref: f36c1e158477afc4877b8e348a1fd6a93f919a37
