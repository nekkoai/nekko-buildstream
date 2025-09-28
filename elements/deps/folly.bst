kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/libevent.bst
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/glog.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- deps/boost.bst
- deps/double-conversion.bst
- deps/fast-float.bst

variables:
  cmake-local: >-
    -D BUILD_TESTS=OFF
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=on
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D LIB_INSTALL_DIR="%{lib}"
    -D CMAKE_INSTALL_DIR="%{lib}/cmake/folly"
      
sources:
- kind: git
  url: github:facebook/folly
  #track: v2022.01.31.00
  #track: main
  track: v2025.09.08.00
  ref: f3284fba4b26ddfe5cfded4486859d7d060f5c44
- kind: patch
  path: static/patches/folly-glog.patch
