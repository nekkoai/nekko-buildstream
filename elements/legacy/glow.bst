kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- deps/protobuf-static.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/abseil-cpp.bst

depends:
- base/freedesktop-sdk.bst:components/gflags.bst
- base/freedesktop-sdk.bst:components/libpng.bst
- base/freedesktop-sdk.bst:components/libunwind.bst
- deps/folly.bst
- deps/onnx.bst
- deps/gtest.bst
- deps/gbenchmark.bst
- legacy/neuralizer.bst
- platform/et-driver.bst

# TODO: we already have fp16 for torch, but it doesn't have a cmake package ... so submodule for now
#- deps/fp16.bst
# -D fp16_PROVIDER=find_package

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
    -D googlebenchmark_PROVIDER=find_package
    -D googletest_PROVIDER=find_package
    -D GLOW_WITH_JEMALLOC=off
    -D CMAKE_POSITION_INDEPENDENT_CODE=on
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5
    -D GFLAGS_USE_TARGET_NAMESPACE=gflags
    -D BUILD_SHARED_LIBS=on
    -D GLOW_BUILD_PORTABLE_BINARIES=on

sources:
- kind: git_repo
  url: github:nekkoai/glow
  track: et
  ref: ecb67865036aa03faafbc3034bde44785190334f
- kind: git_module
  path: tests/OutputCheck
  url: github:stp/OutputCheck
  ref: eab62a5dd5129f6a4ebfbe4bbe41d35611f7c48d
- kind: git_module
  path: thirdparty/foxi
  url: github:houseroad/foxi
  ref: c278588e34e535f0bb8f00df3880d26928038cad
- kind: git_module
  path: thirdparty/fp16
  url: github:Maratyszcza/FP16
  ref: 34d4bf01bbf7376f2baa71b8fa148b18524d45cf
- kind: patch
  path: static/patches/glow-cmake.patch
