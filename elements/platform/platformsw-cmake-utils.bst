kind: import

variables:
  (@):
  - include/_private/platform-device-toolchain.yml

config:
  source: cmake
  target: '%{cmake_module_path}/aifoundry-utils'

sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 3b90eb5360d7786742a99f8b9a10d07c0840e201
