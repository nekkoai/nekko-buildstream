kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- toolchain/riscv-toolchain.bst

variables:
  command-subdir: etsoc-hal
  (@):
  - include/_private/platform-device-toolchain.yml

public:
  bst:
    split-rules:
      doc:
      - '%{includedir}/**.html'

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
