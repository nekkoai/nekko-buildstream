kind: manual

build-depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    install -D -m644 -t "%{install-root}%{includedir}/pocketfft" *.h

sources:
- kind: git
  url: github:mreineck/pocketfft
  track: cpp
  ref: 0fa0ef591e38c2758e3184c6c23e497b9f732ffa
