kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/abseil-cpp.bst
- base/freedesktop-sdk.bst:components/protobuf.bst

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D SPM_ENABLED_TCMALLOC=OFF
    -D SPM_ENABLED_SHARED=ON
    -D SPM_BUILD_TEST=OFF
    -D SPM_PROTOBUF_PROVIDER=package
    -D SPM_ABSL_PROVIDER=package
    -D SPM_DISABLE_EMBEDDED_DATA=ON

sources:
- kind: git_repo
  url: github:google/sentencepiece
  track: v0.2.1
  ref: 31646a467d2051eb904e0b45de3a73e91fe1c1e3
- kind: patch
  path: static/patches/sentencepiece-header.patch
