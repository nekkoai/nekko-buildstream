kind: autotools

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

sources:
- kind: git
  url: github:libevent/libevent.git
  track: release-*-stable
  ref: release-2.1.12-stable-0-g5df3037d10556bfcb675bc73e516978b75fc7bc7
