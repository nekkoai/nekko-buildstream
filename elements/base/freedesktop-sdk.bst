kind: junction
description: Freedesktop SDK junction

config:
  overrides:
    # TODO we need PIC-able gflags
    components/gflags.bst: deps/gflags.bst
    # TODO we need libjpeg to support 70+ (JPEG7)
    components/jpeg.bst: deps/jpeg.bst
    # TODO we need to bring x264 and remove nvenc
    components/ffmpeg.bst: deps/ffmpeg.bst

sources:
- kind: git_repo
  url: gitlab:freedesktop-sdk/freedesktop-sdk.git
  track: freedesktop-sdk-25.08*
  ref: freedesktop-sdk-25.08.2-0-g2772ab3c978ca761082aa428a9d47eee04650072
