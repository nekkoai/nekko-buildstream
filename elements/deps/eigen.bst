kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
      
sources:
- kind: git
  url: gitlab:libeigen/eigen
  #track: master
  #ref: e0a59e5a66e6d16fa93ab4f5e48bf539205e837f
  track: 3.4
  ref: 5c81034fc1aaea2727df479337e43a1e08c1a5ee
