kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/glog.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- base/freedesktop-sdk.bst:components/lz4.bst
- deps/cereal.bst
- deps/tl-expected.bst
- deps/nlohmann-json.bst
- deps/backward.bst
- platform/et-trace.bst
- platform/device-api.bst
- legacy/et-driver.bst
- legacy/neuralizer.bst

depends:
- base/freedesktop-sdk.bst:components/glog.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- base/freedesktop-sdk.bst:components/lz4.bst
- deps/cereal.bst
- deps/tl-expected.bst
- deps/nlohmann-json.bst
- deps/backward.bst
- platform/et-trace.bst
- platform/device-api.bst
- legacy/et-driver.bst
- legacy/neuralizer.bst

# todo handle options - see protobuf for an example
# https://github.com/protocolbuffers/protobuf/blob/main/cmake/protobuf-options.cmake
variables:
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D tl-expected_PROVIDER=find_package
    -D CMAKE_COMPILE_WARNING_AS_ERROR=off
    -D ENABLE_WARNINGS_AS_ERRORS=off
    -D ENABLE_TESTS=off
    -D ENABLE_BENCHMARKS=off
    -D ET_TRACE_UTILS_INSTALL_LIB=on

sources:
- kind: git_repo
  url: github:nekkoai/trace-utils
  track: master
  ref: ea0ef6e305bf01ef44733a6d0040489c06e8a5ab
- kind: patch
  path: static/patches/et-trace-utils-cmake-gcc.patch
