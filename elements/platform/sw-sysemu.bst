kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/glog.bst
- platform/common-sw.bst
- platform/platformsw-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/glog.bst

variables:
  command-subdir: sw-sysemu
  (@):
  - include/_private/platform-host-toolchain.yml
  cmake-local: >-
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
- kind: patch_queue
  path: static/patches/platformsw/sw-sysemu
