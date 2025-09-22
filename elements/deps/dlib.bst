kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/pybind.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D BUILD_SHARED_LIBS=on

sources:
- kind: git
  url: github:davisking/dlib
  track: v19.24.9
  ref: 9c639e3091b8c41bc70621e6b95fdfd6edc46910
