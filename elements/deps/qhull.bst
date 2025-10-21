kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:qhull/qhull
  track: master
  ref: v8.1-alpha6-0-gd1c2fc0caa5f644f3a0f220290d4a868c68ed4f6
