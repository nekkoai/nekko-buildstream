kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- base/freedesktop-sdk.bst:components/abseil-cpp.bst

variables:
  cmake-local: >-
    -Dprotobuf_BUILD_TESTS:BOOL=OFF
    -Dprotobuf_ABSL_PROVIDER=package
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DBUILD_SHARED_LIBS=OFF

environment:
  LDFLAGS: ''

sources:
- kind: git_repo
  url: github:protocolbuffers/protobuf.git
  track: v*
  exclude:
  - '*head*'
  - '*rc*'
  - '*dev*'
  ref: v32.1-0-g7fcfd66022455635fa29af92987cdc0967efd4f3
- kind: patch
  path: static/patches/protobuf-visibility-default.patch
