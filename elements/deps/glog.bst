kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

sources:
- kind: git
  url: github:google/glog.git
  track: v*
  ref: v0.7.1-0-g7b134a5c82c0c0b5698bb6bf7a835b230c5638e4
