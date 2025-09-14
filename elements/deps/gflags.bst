kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DLIB_INSTALL_DIR:STRING="%{lib}"

sources:
- kind: git
  url: github:gflags/gflags.git
  track: v*
  ref: v2.2.2-0-ge171aa2d15ed9eb17054558e0b3a6a413bb01067
