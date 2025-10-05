kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/python3-protobuf.bst
- deps/boost.bst
- deps/pybind.bst

depends:
- base/freedesktop-sdk.bst:components/python3-protobuf.bst

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
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc

sources:
- kind: git_repo
  url: github:onnx/onnx
  track: v1.18.0
  ref: v1.18.0-0-ge709452ef2bbc1d113faf678c24e6d3467696e83
- kind: patch_queue
  path: static/patches/onnx
