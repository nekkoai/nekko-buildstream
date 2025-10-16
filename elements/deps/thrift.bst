kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/openssl.bst
- base/freedesktop-sdk.bst:components/glib.bst
- deps/boost.bst

variables:
  cmake-local: >-
    -D CMAKE_INSTALL_PREFIX:PATH="%{prefix}"
    -D CMAKE_INSTALL_LIBDIR:PATH="%{lib}"
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D LIB_SUFFIX="/%{gcc_triplet}"
    -D BUILD_SHARED_LIBS=ON
    -D WITH_AS3=OFF
    -D WITH_JAVA=OFF
    -D WITH_JAVASCRIPT=OFF
    -D WITH_PYTHON=OFF
    -D WITH_NODEJS=OFF
    -D BUILD_COMPILER=OFF

sources:
- kind: git_repo
  url: github:apache/thrift
  track: master
  ref: v0.22.0-88-gd9a97c1610372eeb6db9f1a54e590a0a89067aea
