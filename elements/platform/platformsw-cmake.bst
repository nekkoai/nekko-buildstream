kind: import

variables:
  (@):
  - include/_private/platform-device-toolchain.yml

config:
  source: cmake-modules
  target: '%{cmake_module_path}'

# Use a local source to stage our file
sources:
- kind: git_repo
  url: github:aifoundry-org/et-platform
  track: master
  ref: 41eda51b5a532deea4e6da0b988f1a32c968a5d9
- kind: patch_queue
  path: static/patches/platformsw/platformsw-cmake
