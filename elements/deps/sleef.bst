kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

#depends:

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D SLEEF_BUILD_TESTS=OFF
    -D BUILD_SHARED_LIBS=ON

sources:
- kind: git
  url: github:shibatch/sleef
  #track: master
  #ref: 51cc68ab794a49d9c80f4975b81211a98b346f01
  track: 3.8
  ref: 5a1d179df9cf652951b59010a2d2075372d67f68
#- kind: patch
#  path: static/patches/sleef-tlflags-cmake.patch
