kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

# todo - tests do not specify C++ version flags so fail
variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CLANG_PLUS_PLUS=off
    -D GCC_PLUS_PLUS=off
      
sources:
- kind: git
  url: github:dcleblanc/SafeInt
  track: master
  ref: 1c94d38fe4c19fe17792de5e0f6619258c94bb30
- kind: patch
  path: static/patches/safeint-cmake.patch
