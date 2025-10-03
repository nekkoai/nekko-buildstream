kind: import

variables:
  (@):
  - include/_private/platform-host-toolchain.yml

config:
  source: sw-sysemu/elfio
  target: "%{prefix}/include/elfio"

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
