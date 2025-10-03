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
    -D GIT_HASH_STRING=62a29419873c2d5f910a2fb530d7dc0419e1e0e5
    -D GIT_HASH_ARRAY="{ 0x62, 0xa2, 0x94, 0x19, 0x87, 0x3c, 0x2d, 0x5f, 0x91, 0x0a, 0x2f, 0xb5, 0x30, 0xd7, 0xdc, 0x04, 0x19, 0xe1, 0xe0, 0xe5, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }"
    -D GIT_VERSION_STRING=62a29419
    -D GIT_VERSION_ARRAY="{ '6', '2', 'a', '2', '9', '4', '1', '9', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }"

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
