kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git
  url: github:microsoft/BlingFire
  track: master
  ref: 18e9a19e586095fb60d629fa850fb610d5bca605
