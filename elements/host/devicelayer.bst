kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/boost.bst
- host/cmake-modules.bst
- host/et-driver.bst
- host/sw-sysemu-elfio.bst
- host/sw-sysemu.bst
- host/common-sw.bst

variables:
  command-subdir: host/devicelayer
  (@):
  - include/_private/host-toolchain.yml

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
- kind: patch
  path: static/patches/devicelayer-compat.patch
