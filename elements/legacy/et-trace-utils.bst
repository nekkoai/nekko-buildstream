kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- base/freedesktop-sdk.bst:components/glog.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- base/freedesktop-sdk.bst:components/lz4.bst
- deps/cereal.bst
- deps/tl-expected.bst
- deps/nlohmann-json.bst
- deps/backward.bst
- host/et-trace.bst
- host/device-api.bst
- legacy/neuralizer.bst

depends:
- base/freedesktop-sdk.bst:components/glog.bst
- base/freedesktop-sdk.bst:components/fmtlib.bst
- base/freedesktop-sdk.bst:components/lz4.bst
- deps/cereal.bst
- deps/tl-expected.bst
- deps/nlohmann-json.bst
- deps/backward.bst
- host/et-trace.bst
- host/device-api.bst
- legacy/neuralizer.bst

variables:
  command-subdir: trace-utils
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_POSITION_INDEPENDENT_CODE=ON
    -D tl-expected_PROVIDER=find_package
    -D CMAKE_COMPILE_WARNING_AS_ERROR=off
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
