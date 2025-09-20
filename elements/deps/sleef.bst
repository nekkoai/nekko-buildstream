kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/tlfloat.bst

depends:
- deps/tlfloat.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D SLEEF_BUILD_TESTS=OFF
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git
  url: github:shibatch/sleef
  track: master
  ref: 51cc68ab794a49d9c80f4975b81211a98b346f01
  checkout-submodules: false
  submodules:
    submodules/tlfloat:
      url: github:shibatch/tlfloat
      checkout: False
- kind: patch
  path: static/patches/sleef-tlflags-cmake.patch
