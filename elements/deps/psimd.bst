kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git
  url: github:Maratyszcza/psimd
  track: master
  ref: 072586a71b55b7f8c584153d223e95687148a900
