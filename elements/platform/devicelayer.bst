kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/g3log.bst
- deps/boost.bst
- platform/platformsw-cmake.bst
- platform/et-ioctl.bst
- platform/common-sw.bst
- platform/sw-sysemu.bst
- platform/sw-sysemu-elfio.bst

depends:
- deps/g3log.bst
- deps/boost.bst
- platform/et-ioctl.bst
- platform/common-sw.bst
- platform/sw-sysemu.bst
- platform/sw-sysemu-elfio.bst

variables:
  command-subdir: devicelayer
  (@):
  - include/_private/platform-host-toolchain.yml
  cmake-local: -D ENABLE_TESTS=OFF

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
- kind: patch_queue
  path: static/patches/platformsw/devicelayer
