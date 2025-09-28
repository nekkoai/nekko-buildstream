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
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
