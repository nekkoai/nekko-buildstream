kind: autotools

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:NixOS/patchelf.git
  track: 0.18-maintenance
  ref: 0.15.5-5-g795253a97e3b4e01ee07a29c306dcdda0c226e0b
