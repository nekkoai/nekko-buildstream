kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/boost.bst
- deps/double-conversion.bst
- deps/fast-float.bst
# todo these are in freedesktopsdk but are not exported in the sdk image ...
- deps/libevent.bst
- deps/gflags.bst
- deps/glog.bst

variables:
  cmake-local: >-
    -D BUILD_TESTS=OFF
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
      
sources:
- kind: git
  url: github:facebook/folly
  #track: v2022.01.31.00
  #track: main
  track: v2025.09.08.00
  ref: f3284fba4b26ddfe5cfded4486859d7d060f5c44
- kind: patch
  path: static/patches/folly-glog.patch
