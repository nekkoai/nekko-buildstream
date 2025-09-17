kind: stack

depends:
- nutcracker-host.bst
- legacy/llvm.bst
- legacy/neuralizer.bst
- legacy/glow.bst
- legacy/onnxruntime.bst
- legacy/python3-site-nekko.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
