kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/glog.bst
- host/sw-sysemu-elfio.bst
- host/et-driver.bst

depends:
- deps/glog.bst

variables:
  command-subdir: host/sw-sysemu
  (@):
  - include/_private/host-toolchain.yml

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
- kind: patch
  path: static/patches/sw-sysemu-cstdint.patch
