kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst
- deps/onnxruntime.bst
- deps/boost.bst
- legacy/et-trace-utils.bst
- legacy/glow.bst

variables:
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags

sources:
- kind: git_repo
  url: github:nekkoai/onnxruntime-etglow
  track: main
  ref: 873483eaf06700a34256f1f4f19354d831fd6922
