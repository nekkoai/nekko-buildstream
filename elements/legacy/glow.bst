kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- base/freedesktop-sdk.bst:components/protobuf.bst 
- base/freedesktop-sdk.bst:components/gflags.bst
- deps/folly.bst
- deps/onnx.bst
- deps/gtest.bst
- legacy/neuralizer.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst 
- base/freedesktop-sdk.bst:components/gflags.bst
- deps/folly.bst
- deps/onnx.bst
- deps/gtest.bst
- legacy/neuralizer.bst

variables:
  command-subdir: glow
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D GLOW_BUILD_TESTS=off
    -D GLOW_BUILD_ETSOC_WITH_SYSEMU_ARTIFACTS=off
    -D folly_PROVIDER=find_package
    -D onnx_PROVIDER=find_package
    -D GLOW_WITH_JEMALLOC=off
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/glow-cmake.patch
