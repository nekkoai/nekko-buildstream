kind: stack

depends:
- nutcracker-device.bst
- nutcracker-host.bst
- legacy/llvm.bst
- legacy/neuralizer.bst
- legacy/glow.bst
- legacy/onnxruntime.bst
# friendly items for usability and debugging below
- legacy/python3-site-nekko.bst
- base/freedesktop-sdk.bst:integration/ldconfig.bst
- legacy/ldconfig-nekko.bst
- base/freedesktop-sdk.bst:components/bash-config.bst
- legacy/bash-profile-nekko.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
- base/freedesktop-sdk.bst:components/gdb.bst
- base/freedesktop-sdk.bst:components/vim.bst
