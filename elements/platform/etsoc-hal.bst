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
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
