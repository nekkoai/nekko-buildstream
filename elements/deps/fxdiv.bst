kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D FXDIV_BUILD_TESTS=OFF
    -D FXDIV_BUILD_BENCHMARKS=OFF

sources:
- kind: git_repo
  url: github:Maratyszcza/fxdiv
  track: master
  ref: 63058eff77e11aa15bf531df5dd34395ec3017c8
