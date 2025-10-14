kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON

sources:
- kind: git_repo
  url: github:ArthurSonzogni/FTXUI
  track: v6.1.9
  ref: 5cfed50702f52d51c1b189b5f97f8beaf5eaa2a6 
