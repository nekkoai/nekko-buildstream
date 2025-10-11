kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/libunwind.bst
- deps/folly.bst
- deps/onnx.bst
- deps/gtest.bst
- legacy/neuralizer.bst
- legacy/et-driver.bst

depends:
- base/freedesktop-sdk.bst:components/protobuf.bst
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/libunwind.bst
- deps/folly.bst
- deps/onnx.bst
- deps/gtest.bst
- legacy/neuralizer.bst
- legacy/et-driver.bst

variables:
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D CMAKE_INSTALL_RPATH="%{lib}"
    -D GLOW_BUILD_TESTS=off
    -D GLOW_BUILD_WARNINGS_AS_ERRORS=off
    -D GLOW_BUILD_ETSOC_WITH_SYSEMU_ARTIFACTS=off
    -D GLOW_BUILD_ETSOC_WARNINGS_AS_ERRORS=off
    -D folly_PROVIDER=find_package
    -D onnx_PROVIDER=find_package
    -D GLOW_WITH_JEMALLOC=off
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D BUILD_SHARED_LIBS=on

sources:
- kind: git_repo
  url: github:nekkoai/glow
  track: et
  ref: ecb67865036aa03faafbc3034bde44785190334f
- kind: patch
  path: static/patches/glow-cmake.patch
