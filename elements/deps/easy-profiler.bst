kind: cmake

build-depends:
- base/freedesktop-sdk.bst:sdk.bst

variables:
  cmake-local: >-
    -D CMAKE_POLICY_VERSION_MINIMUM=3.5

sources:
- kind: git
  url: github:yse/easy_profiler
  track: v2.1.0
  ref: 046d9bd40cfd55ca3b1d798b16ad2a5673f66806
- kind: patch
  path: static/patches/easy-profiler-cmake.patch
