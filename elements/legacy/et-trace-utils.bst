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
  command-subdir: trace-utils
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
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/et-trace-utils-cmake-gcc.patch
