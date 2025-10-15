kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/ccache.bst
- deps/boost.bst
- deps/nlohmann-json.bst
- deps/cereal.bst
- platform/platformsw-base.bst
- legacy/dnn-library-api.bst
- legacy/llvm.bst

depends:
- base/freedesktop-sdk.bst:components/ccache.bst
- deps/boost.bst
- deps/nlohmann-json.bst
- deps/cereal.bst
- platform/platformsw-base.bst
- legacy/dnn-library-api.bst
- legacy/llvm.bst
- deps/python3-tabulate.bst

variables:
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D WARNINGS_AS_ERRORS=off
    -D ET_LLVM_INSTALL_DIR=/opt/toolchain/llvm
    -D ET_GCC_INSTALL_DIR=/opt/toolchain/gnu
    -D ENABLE_COMPILER_CACHE=ON
    -D NEURALIZER_LINK_LLVM=1
    -D ETCOMMONLIBS_INCLUDE_DIRECTORIES=/opt/nekko/platform/cm-umode/include
    -D ETCOMMONLIBS_LIBDIR=/opt/nekko/platform/cm-umode/lib/
    -D ETTRACE_INCLUDE_DIRECTORIES="/opt/nekko/platform/include/esperanto"
    -D DNNLIB_INCLUDE_DIRECTORIES="/opt/nekko/platform/include"
    -D BUILD_DOCS=off
    -D BUILD_TESTS=off

sources:
- kind: git_repo
  url: github:nekkoai/neuralizer
  track: master
  ref: eb73a07b5321b24e3cda0d26f3a78fcd7ebc9b4d
- kind: patch
  path: static/patches/neuralizer-llvm.patch
