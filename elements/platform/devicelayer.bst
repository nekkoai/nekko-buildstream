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
  cmake-local:
    -D ENABLE_TESTS=OFF

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
- kind: patch_queue
  path: static/patches/platformsw/devicelayer
