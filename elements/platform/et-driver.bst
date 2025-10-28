kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  command-subdir: et-driver
  (@):
  - include/_private/platform-host-toolchain.yml

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 022221990ca713f946eaa4379817cb59bb852be4
- kind: patch
  path: static/patches/et-driver-cmake.patch
