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
  ref: 62a29419873c2d5f910a2fb530d7dc0419e1e0e5
- kind: patch_queue
  path: static/patches/platformsw/platformsw-cmake
