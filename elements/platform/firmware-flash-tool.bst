kind: cmake

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:components/json-c.bst

variables:
  command-subdir: firmware-flash-tool
  (@):
  - include/_private/platform-host-toolchain.yml

sources:
- kind: git
  url: github:aifoundry-org/et-platformsw
  track: master
  ref: d08fcdcb37654f5ef4e9989c9dba4b9c07312038
