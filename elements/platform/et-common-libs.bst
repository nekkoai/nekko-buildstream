kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/et-trace.bst
- platform/etsoc-hal.bst

depends:
- platform/et-trace.bst
- platform/etsoc-hal.bst

variables:
  command-subdir: et-common-libs
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
    -D ENABLE_WARNINGS_AS_ERRORS=OFF

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
- kind: patch_queue
  path: static/patches/platformsw/et-common-libs
