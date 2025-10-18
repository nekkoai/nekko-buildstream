kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst
- platform/et-common-libs.bst

# TODO While this is in legacy/ namespace, it needs the device toolchain and will end up in platform
variables:
  (@):
  - include/_private/platform-device-toolchain.yml
  cmake-local: >-
    -D ENABLE_WARNINGS_AS_ERRORS=off

sources:
- kind: git_repo
  url: github:nekkoai/dnn-library
  track: master
  ref: cd802d7a24dc4d22a2bddff4447c1cf00a51d49a
- kind: patch
  path: static/patches/platformsw-dnn-library.patch
