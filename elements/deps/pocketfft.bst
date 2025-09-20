kind: import

# todo this is a header-only library - we really only want pocketfft_hdronly.h staged
config:
  target: "/usr/include/pocketfft"

sources:
- kind: git
  url: github:mreineck/pocketfft
  track: cpp
  ref: 0fa0ef591e38c2758e3184c6c23e497b9f732ffa
