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
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
