kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst

variables:
  command-subdir: libkineto
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D KINETO_BUILD_TESTS=OFF
    -D KINETO_LIBRARY_TYPE=shared

sources:
- kind: git_repo
  url: github:pytorch/kineto
  track: main
  ref: 073ff33828fcf7e2ef4ac7cf4ea54eb1e225af6e
- kind: git_module
  path: libkineto/third_party/dynolog
  url: github:facebookincubator/dynolog
  ref: d2ffe0a4e3acace628db49974246b66fc3e85fb1
- kind: patch
  path: static/patches/kineto-cmake.patch
