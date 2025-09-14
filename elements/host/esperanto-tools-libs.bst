kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/boost.bst
- deps/cereal.bst
- deps/gflags.bst
- deps/libcap-cmake.bst
- deps/easy-profiler.bst
- host/cmake-modules.bst
- host/et-driver.bst
- host/sw-sysemu-elfio.bst
- host/sw-sysemu.bst
- host/device-api.bst
- host/devicelayer.bst
- host/common-sw.bst

depends:
- deps/boost.bst
- deps/cereal.bst
- deps/gflags.bst
- deps/libcap-cmake.bst
- deps/easy-profiler.bst
- host/cmake-modules.bst
- host/et-driver.bst
- host/sw-sysemu-elfio.bst
- host/sw-sysemu.bst
- host/device-api.bst
- host/devicelayer.bst
- host/common-sw.bst

variables:
  command-subdir: host/esperanto-tools-libs
  (@):
  - include/_private/host-toolchain.yml
  cmake-local: >-
    -D BUILD_TOOLS=OFF
    -D BUILD_TESTS=OFF
    -D BUILD_DOCS=OFF
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
- kind: patch
  path: static/patches/esperanto-tools-libs-cmake.patch
