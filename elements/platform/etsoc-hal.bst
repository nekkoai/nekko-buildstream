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
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
