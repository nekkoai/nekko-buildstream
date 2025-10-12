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
  ref: 3be3192f35ef706a692ac1ddf4dbcfcf86c83df2
