kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/fmtlib.bst
- deps/ftxui.bst
- platform/device-api.bst
- platform/devicelayer.bst
- legacy/et-driver.bst
- legacy/device-management.bst
- legacy/et-trace-utils.bst

variables:
  command-subdir: device-management-application
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D CMAKE_COMPILE_WARNING_AS_ERROR=off
    -D ENABLE_WARNINGS_AS_ERRORS=off
    -D ENABLE_TESTS=off
    -D ftxui_PROVIDER=find_package

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/device-management-application.patch
