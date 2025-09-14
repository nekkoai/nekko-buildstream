kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  command-subdir: host/et-driver
  (@):
  - include/_private/host-toolchain.yml

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
