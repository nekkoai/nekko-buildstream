kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/g3log.bst
- deps/gtest.bst
- platform/platformsw-cmake.bst

variables:
  command-subdir: common-sw
  (@):
  - include/_private/platform-host-toolchain.yml

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
