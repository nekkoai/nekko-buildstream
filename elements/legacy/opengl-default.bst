kind: import

# todo do this in a far less hard-coded approach ... will do for now

# Use a local source to stage our file
sources:
- kind: local
  path: static/50_default.json

config:
  target: "%{libdir}/GL/glvnd/egl_vendor.d"
