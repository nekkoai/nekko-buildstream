kind: manual

build-depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}/dr_libs" *.h

sources:
- kind: git
  url: github:mackron/dr_libs
  track: master
  ref: 54d68051e606493fa09a9e6e0a08f0030aac2c0e
