kind: import

depends:
- platform/et-ioctl-filter.bst

variables:
  (@):
  - include/_private/platform-host-toolchain.yml

config:
  source: et-driver/
  target: "%{prefix}/include"

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
