kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- legacy/glow.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst 
- legacy/glow.bst

variables:
  command-subdir: onnx/onnxruntime
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D onnxruntime_ENABLE_PYTHON=on
    -D onnxruntime_USE_ETGLOW=on
    -D GFLAGS_USE_TARGET_NAMESPACE=on
    -D onnxruntime_BUILD_UNIT_TESTS=off
    -D onnxruntime_BUILD_SHARED_LIB=on

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/onnxruntime-cmake.patch
