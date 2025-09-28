kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/platformsw-cmake.bst
- platform/device-api.bst
- platform/signedImageFormat.bst
- platform/et-trace.bst
- platform/etsoc-hal.bst
- platform/et-common-libs.bst
- platform/device-api.bst

variables:
  command-subdir: device-minion-runtime
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
    -D BUILD_DOC=OFF
    -D ENABLE_CMD_EXECUTION_TRACE=OFF
    -D GIT_HASH_STRING=d08fcdcb37654f5ef4e9989c9dba4b9c07312038
    -D GIT_HASH_ARRAY="{ 0xd0, 0x8f, 0xcd, 0xcb, 0x37, 0x65, 0x4f, 0x5e, 0xf4, 0xe9, 0x98, 0x9c, 0x9d, 0xba, 0x4b, 0x9c, 0x07, 0x31, 0x20, 0x38, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }"
    -D GIT_VERSION_STRING=d08fcdcb
    -D GIT_VERSION_ARRAY="{ 'd', '0', '8', 'f', 'c', 'd', 'c', 'b', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }"

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
