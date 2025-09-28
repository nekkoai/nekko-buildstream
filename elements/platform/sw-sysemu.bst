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
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
- kind: patch_queue
  path: static/patches/platformsw/sw-sysemu
