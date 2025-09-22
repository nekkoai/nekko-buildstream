kind: junction
description: Freedesktop SDK junction

config:
  overrides:
     # TODO we need PIC-able gflags
     components/gflags.bst: deps/gflags.bst
     # TODO we need libjpeg to support 70+ (JPEG7)
     components/jpeg.bst: deps/jpeg.bst

sources:
- kind: git
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: release/25.08
  ref: 6271650d8d9bb474c9e3defc983f482ba25213ee
