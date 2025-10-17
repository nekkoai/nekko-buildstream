kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
  (@):
  - include/_private/platform-host-toolchain.yml

sources:
- kind: git_repo
  url: github:aifoundry-org/et-driver
  track: master
  ref: 049b04d0fb812381a8189558c2886a60e53cbfe7
- kind: patch
  path: static/patches/et-driver-cmake.patch
