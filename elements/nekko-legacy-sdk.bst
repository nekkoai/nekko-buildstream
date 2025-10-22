kind: stack

depends:
- nekko-legacy.bst
# add in additional items from platforms
- platform/platformsw-full.bst
# bring in full freedesktop SDK
- base/freedesktop-sdk.bst:sdk.bst
