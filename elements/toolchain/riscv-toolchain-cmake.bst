kind: import

# Use a local source to stage our file
sources:
- kind: local
  path: static/platformsw-riscv-toolchain.cmake

variables:
  (@):
   - include/_private/platform-device-toolchain.yml

config:
  target: '%{cmake_module_path}'
