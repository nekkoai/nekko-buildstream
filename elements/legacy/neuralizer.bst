kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- deps/boost.bst
- deps/nlohmann-json.bst
- deps/cereal.bst
- nutcracker-device.bst
- nutcracker-host.bst
- legacy/dnn-library-api.bst
- legacy/llvm.bst

depends:
- deps/boost.bst
- deps/nlohmann-json.bst
- deps/cereal.bst
- nutcracker-device.bst
- nutcracker-host.bst
- legacy/dnn-library-api.bst
- legacy/llvm.bst

variables:
  command-subdir: neuralizer
  (@):
  - include/_private/legacy-toolchain.yml
  cmake-local: >-
    -D WARNINGS_AS_ERRORS=off
    -D ET_LLVM_INSTALL_DIR=/opt/nekko/legacy
    -D NEURALIZER_LINK_LLVM=1
    -D ETCOMMONLIBS_INCLUDE_DIRECTORIES=/opt/nekko/device/cm-umode/include
    -D ETCOMMONLIBS_LIBDIR=/opt/nekko/device/cm-umode/lib/
    -D ETTRACE_INCLUDE_DIRECTORIES="/opt/nekko/device/include/esperanto"
    -D DNNLIB_INCLUDE_DIRECTORIES="/opt/nekko/device/include"
    -D BUILD_DOCS=off
    -D BUILD_TESTS=off

sources:
- kind: git_repo
  url: github:nekkoai/atlantis
  track: master
  ref: 7a9f893254e81974f9ba57411f17b166e2e4def2
- kind: patch
  path: static/patches/neuralizer-llvm.patch
