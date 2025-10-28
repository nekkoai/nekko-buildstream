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
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
