kind: import

variables:
  (@):
   - include/_private/platform-device-toolchain.yml

config:
  source: cmake-modules
  target: '%{cmake_module_path}'

# Use a local source to stage our file
sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
- kind: patch_queue
  path: static/patches/platformsw/platformsw-cmake
