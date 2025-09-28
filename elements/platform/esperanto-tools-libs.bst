kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/libcap.bst
- deps/boost.bst
- deps/cereal.bst
- deps/libcap-cmake.bst
- deps/easy-profiler.bst
- platform/platformsw-cmake.bst
- platform/common-sw.bst
- platform/devicelayer.bst
- platform/device-api.bst
- platform/devicelayer.bst
- platform/device-bootloaders.bst
- platform/device-minion-runtime.bst

depends:
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/libcap.bst
- deps/boost.bst
- deps/cereal.bst
- deps/libcap-cmake.bst
- deps/easy-profiler.bst
- platform/devicelayer.bst
- platform/device-api.bst
- platform/devicelayer.bst
- platform/device-bootloaders.bst
- platform/device-minion-runtime.bst

variables:
  command-subdir: esperanto-tools-libs
  (@):
  - include/_private/platform-host-toolchain.yml
  cmake-local: >-
    -D BUILD_TOOLS=OFF
    -D BUILD_TESTS=OFF
    -D BUILD_DOCS=OFF
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
- kind: patch
  path: static/patches/platformsw-esperanto-tools-libs.patch
