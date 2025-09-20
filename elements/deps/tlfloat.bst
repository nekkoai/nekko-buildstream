kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=ON
    -D BUILD_TESTS=OFF
    -D BUILD_UTILS=OFF

sources:
- kind: git
  url: github:shibatch/tlfloat
  track: main
  ref: 38f525b838b05dd5c266d34b16cb554cf1fe37c5
