kind: import

# todo need to filter out just the include files!!
# https://docs.buildstream.build/master/elements/filter.html
config:
  target: "/usr/include/dr_libs"

sources:
- kind: git
  url: github:mackron/dr_libs
  track: master
  ref: 54d68051e606493fa09a9e6e0a08f0030aac2c0e
