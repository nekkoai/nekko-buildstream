kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/fmtlib.bst
- deps/ftxui.bst
- deps/nlohmann-json.bst
- platform/device-api.bst
- platform/devicelayer.bst
- platform/et-trace.bst
- platform/device-management.bst
- platform/et-driver.bst

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
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
- kind: patch_queue
  path: static/patches/platformsw/device-management-application
