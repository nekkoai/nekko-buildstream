kind: stack

depends:
- nutcracker-legacy.bst
# add in additional items from platforms
- platform/platformsw-full.bst
# bring in full freedesktop SDK
- base/freedesktop-sdk.bst:sdk.bst
