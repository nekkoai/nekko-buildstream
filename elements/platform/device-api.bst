kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- platform/common-sw.bst

variables:
  command-subdir: device-api
  (@):
  - include/_private/platform-host-toolchain.yml
  cmake-local: >-
    -D GIT_HASH_STRING=d08fcdcb37654f5ef4e9989c9dba4b9c07312038

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
