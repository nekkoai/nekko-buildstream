kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-protobuf.bst
- deps/boost.bst
- deps/pybind.bst

variables:
  cmake-local: >-
    -D BUILD_TESTS=OFF
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_ONNX_PYTHON=on
    -D ONNX_DISABLE_STATIC_REGISTRATION=on
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc
      
sources:
- kind: git_repo
  url: github:onnx/onnx
  track: v1.16.2
  ref: 3bf92c03a9f27eba3bda1e5b9e63ea20ec213557
- kind: patch
  path: static/patches/onnx-python-cmake.patch
