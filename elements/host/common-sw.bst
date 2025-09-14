kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/glog.bst
- deps/g3log.bst
- host/cmake-modules.bst

depends:
- deps/glog.bst
- deps/g3log.bst

variables:
  command-subdir: host/common-sw
  (@):
  - include/_private/host-toolchain.yml
  cmake-local: >-
    -D BUILD_TESTS=off

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
- kind: patch
  path: static/patches/common-sw-g3log.patch
