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
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
