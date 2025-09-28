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
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
