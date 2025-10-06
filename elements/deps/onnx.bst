kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- deps/boost.bst
- deps/pybind.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/python3-protobuf.bst
- deps/python3-ml_dtypes.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/python3-typing-extensions.bst

#variables:
#  cmake-local: >-

# todo cover your eyes
config:
  install-commands:
  - |
    %{python} -minstaller %{dist-dir}/*.whl --destdir %{install-root}
  - |
    env DESTDIR="%{install-root}" cmake --build .setuptools-cmake-build --target install

# todo - bring in cmake-args , local, and global ...
environment:
  CMAKE_ARGS: >-
    -D CMAKE_INSTALL_PREFIX:PATH="%{prefix}"
    -D CMAKE_INSTALL_LIBDIR:PATH="%{lib}"
    -D BUILD_SHARED_LIBS=on
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D ONNX_BUILD_TESTS=OFF
    -D ONNX_BUILD_PYTHON=on
    -D ONNX_DISABLE_STATIC_REGISTRATION=on
    -D ONNX_BUILD_CUSTOM_PROTOBUF=off
    -D ONNX_USE_PROTOBUF_SHARED_LIBS=on
    -D ONNX_BUILD_TESTS=OFF
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc

# 1.19.1 has a cmake fix that prevents compiling everything twice, so bring that in.
#track: v1.19.0
#ref: 57b9c6a4f6eebb09ae1b34cfb632078518f72832
sources:
- kind: git
  url: github:onnx/onnx
  track: rel-1.19.1
  ref: e11938a232432630e1ff8904bb80091af6823021
- kind: patch_queue
  path: static/patches/onnx
