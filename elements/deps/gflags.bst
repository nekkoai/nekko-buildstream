kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DLIB_INSTALL_DIR:STRING="%{lib}"
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D BUILD_SHARED_LIBS=on

sources:
- kind: git_repo
  url: github:gflags/gflags.git
  track: v*
  ref: v2.2.2-0-ge171aa2d15ed9eb17054558e0b3a6a413bb01067
