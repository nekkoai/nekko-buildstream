kind: import

# todo do this in a far less hard-coded approach ... will do for now

# Use a local source to stage our file
sources:
- kind: local
  path: static/profile-nekko.sh

config:
  target: "%{sysconfdir}/profile.d"
