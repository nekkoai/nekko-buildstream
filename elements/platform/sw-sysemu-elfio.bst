kind: import

variables:
  (@):
  - include/_private/platform-host-toolchain.yml

config:
  source: sw-sysemu/elfio
  target: "%{prefix}/include/elfio"

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
