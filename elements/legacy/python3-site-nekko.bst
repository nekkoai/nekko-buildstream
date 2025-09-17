kind: import

# todo do this in a far less hard-coded approach ... will do for now

# Use a local source to stage our file
sources:
- kind: local
  path: static/optnekko.pth

config:
  target: /usr/lib/python3.13/site-packages
