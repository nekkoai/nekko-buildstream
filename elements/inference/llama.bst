kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- platform/platformsw-base.bst

environment:
  ET_TOOLCHAIN: "/opt/toolchain/gnu"

variables:
  (@):
  - include/_private/inference-toolchain.yml
  cmake-local: >-
    -D ET_PLATFORM=/opt/nekko/platform
    -D GGML_ET=ON

sources:
- kind: git_repo
  url: github:aifoundry-org/llama.cpp
  track: et
  ref: 756d5a17e3d533f00938eb3d26cc0297fef08e82
