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
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
