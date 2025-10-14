kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D FP16_BUILD_TESTS=OFF
    -D FP16_BUILD_BENCHMARKS=OFF
    -D FP16_BUILD_COMPARATIVE_BENCHMARKS=OFF

sources:
- kind: git_repo
  url: github:Maratyszcza/FP16
  track: master
  ref: 3d2de1816307bac63c16a297e8c4dc501b4076df
