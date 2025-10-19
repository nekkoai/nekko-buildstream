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
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
