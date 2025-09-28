kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
      
sources:
- kind: git
  url: github:HowardHinnant/date
  track: master
  ref: a5db3aecec580bc78b6c01c118f2628676769b69
