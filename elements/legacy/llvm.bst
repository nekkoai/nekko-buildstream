kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/grep.bst
- base/freedesktop-sdk.bst:components/sed.bst
- deps/gtest.bst

#depends:
# todo can we strip down LLVM_ENABLE_PROJECTS further as we only appear to need support libraries

variables:
  prefix: /opt/toolchain/llvm
  conf-root: llvm
  cmake-local: >-
    -D LLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;lld"
    -D LLVM_EXPERIMENTAL_TARGETS_TO_BUILD="RISCV"
    -D LLVM_ENABLE_RTTI=1
    -D LLVM_INCLUDE_TESTS:BOOL=OFF
    -D LLVM_INCLUDE_DOCS:BOOL=OFF
    -D BUILD_SHARED_LIBS=1
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git
  url: github:nekkoai/llvm-old
  track: master
  ref: 2a34f4de888da0fec76623f0368cf188b4ae459e
- kind: patch
  path: static/patches/llvm-old-updates.patch
