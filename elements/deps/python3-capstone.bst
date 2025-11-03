kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/capstone.bst

variables:
  command-subdir: bindings/python

environment:
  LIBCAPSTONE_PATH: "/usr/lib/%{gcc_triplet}"

sources:
- kind: git_repo
  url: github:capstone-engine/capstone
  track: next
  ref: 6.0.0-Alpha5-27-gc059126d98837a1c4f6988756fe30fc10904f6a6
- kind: patch
  path: static/patches/python3-capstone-libdir.patch
