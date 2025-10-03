kind: stack

depends:
- platform/platformsw-base.bst
- platform/device-management-application.bst
- legacy/llvm.bst
- legacy/neuralizer.bst
- legacy/glow.bst
- legacy/onnxruntime.bst
# Essential programs
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
# Python libraries used by downstream consumers
- deps/python3-pillow.bst
- deps/python3-scipy.bst
- deps/python3-transformers.bst
- deps/python3-torch.bst
# friendly items for usability and debugging below
- legacy/python3-site-nekko.bst
- legacy/ldconfig-nekko.bst
- base/freedesktop-sdk.bst:integration/ldconfig.bst
- base/freedesktop-sdk.bst:integration/app-debug-link.bst
- base/freedesktop-sdk.bst:components/bash-config.bst
- legacy/bash-profile-nekko.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
- base/freedesktop-sdk.bst:components/gdb.bst
- base/freedesktop-sdk.bst:components/vim.bst
- base/freedesktop-sdk.bst:components/less.bst
- base/freedesktop-sdk.bst:components/bzip2.bst
