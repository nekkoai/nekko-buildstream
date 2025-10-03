kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/fmtlib.bst
- deps/ftxui.bst
- deps/nlohmann-json.bst
- platform/device-api.bst
- platform/devicelayer.bst
- legacy/et-driver.bst
- platform/et-trace.bst
- platform/device-management.bst

variables:
  command-subdir: device-management-application
  (@):
  - include/_private/platform-host-toolchain.yml
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_COMPILE_WARNING_AS_ERROR=off
    -D ENABLE_WARNINGS_AS_ERRORS=off
    -D ENABLE_TESTS=off
    -D ftxui_PROVIDER=find_package

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
- kind: patch_queue
  path: static/patches/platformsw/device-management-application
