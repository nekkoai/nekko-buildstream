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
  ref: 78ed9b0d681838afa383aa45dacac2ebee9aee78
- kind: patch_queue
  path: static/patches/platformsw/platformsw-cmake
