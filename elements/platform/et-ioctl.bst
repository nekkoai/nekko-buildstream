kind: manual

build-depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''
  (@):
  - include/_private/platform-host-toolchain.yml

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}" et-driver/et_ioctl.h

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
