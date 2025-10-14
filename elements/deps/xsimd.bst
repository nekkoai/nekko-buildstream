kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:xtensor-stack/xsimd
  track: master
  ref: 13.2.0-0-ge8087990d415d9d953ca148b1448078de21ef038
