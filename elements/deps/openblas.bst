kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D BUILD_SHARED_LIBS=on
      
sources:
- kind: git
  url: github:OpenMathLib/OpenBLAS
  track: v0.3.30
  ref: 993fad6aebbce34a97d3f8c34d6d79d35b64cc48
