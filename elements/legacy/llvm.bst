kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/gtest.bst

#depends:

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
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git
  url: github:nekkoai/llvm-old
  track: master
  ref: 2a34f4de888da0fec76623f0368cf188b4ae459e
- kind: patch
  path: static/patches/llvm-old-updates.patch
