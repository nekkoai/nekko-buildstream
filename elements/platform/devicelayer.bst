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
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
