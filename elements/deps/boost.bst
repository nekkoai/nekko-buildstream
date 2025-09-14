kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D BUILD_SHARED_LIBS=on
      
sources:
# figure out how to do subdirs correctly
#- kind: git
#  url: github:boostorg/boost
#  track: boost-1.89.0
#  #track: master
#  ref: ba4dfdb153688728bb4ec200dbc2aaa534978381
- kind: tar
  url: 
    https://github.com/boostorg/boost/releases/download/boost-1.89.0/boost-1.89.0-cmake.tar.gz
  ref: 954a01219bf818c7fb850fa610c2c8c71a4fa28fa32a1900056bcb6ff58cf908
