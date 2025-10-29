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
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
