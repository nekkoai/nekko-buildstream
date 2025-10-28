kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- platform/platformsw-cmake.bst

depends:
- deps/g3log.bst
- deps/boost.bst
- platform/et-driver.bst
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
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
- kind: patch_queue
  path: static/patches/platformsw/devicelayer
