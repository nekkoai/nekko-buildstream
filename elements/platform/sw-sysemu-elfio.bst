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
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
