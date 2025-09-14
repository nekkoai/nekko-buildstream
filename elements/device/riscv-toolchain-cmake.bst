kind: import

# Use a local source to stage our file
sources:
- kind: local
  path: static/riscv-toolchain.cmake

variables:
  (@):
   - include/_private/device-toolchain.yml

config:
  target: '%{cmake_module_path}'
