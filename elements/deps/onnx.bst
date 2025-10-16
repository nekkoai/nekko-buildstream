kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/python3-protobuf.bst
- deps/boost.bst
- deps/pybind.bst
- deps/protobuf-static.bst

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
  track: v1.17.0
  ref: v1.17.0-0-gb8baa8446686496da4cc8fda09f2b6fe65c2a02c
- kind: patch
  path: static/patches/onnx-python-cmake.patch
