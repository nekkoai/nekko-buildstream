kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:Maratyszcza/psimd
  track: master
  ref: 072586a71b55b7f8c584153d223e95687148a900
