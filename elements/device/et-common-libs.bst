kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- device/riscv-toolchain.bst
- device/et-trace.bst
- device/etsoc-hal.bst

depends:
- device/riscv-toolchain.bst
- device/et-trace.bst
- device/etsoc-hal.bst

variables:
  command-subdir: device/et-common-libs
  (@):
  - include/_private/device-toolchain.yml

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
