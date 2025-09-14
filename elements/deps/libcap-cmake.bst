kind: import

# Use a local source to stage our file
sources:
- kind: local
  path: static/libcap-config.cmake

config:
  target: "%{prefix}/%{cmake_moduledir}/libcap"
