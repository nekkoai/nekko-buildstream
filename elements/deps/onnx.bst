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
    -D BUILD_TESTS=OFF
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_ONNX_PYTHON=on
    -D ONNX_DISABLE_STATIC_REGISTRATION=on
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc

sources:
- kind: git_repo
  url: github:onnx/onnx
  track: v1.16.2
  ref: v1.16.2-0-g3bf92c03a9f27eba3bda1e5b9e63ea20ec213557
- kind: patch
  path: static/patches/onnx-python-cmake.patch
