kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

variables:
#  command-subdir: et-driver
  command-subdir: host/et-driver
  (@):
  - include/_private/platform-host-toolchain.yml

sources:
- kind: git
  url: github:nekkoai/nutcracker
  track: main
  ref: 0e72220972fdaebd4734f19d3ebfe6ad17d6fd16
#- kind: git
#  url: github:aifoundry-org/et-platformsw
#  track: master
#  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
