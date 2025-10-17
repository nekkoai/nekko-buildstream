kind: stack

depends:
- platform/platformsw-base.bst
- platform/device-management-application.bst
- legacy/llvm.bst
- legacy/neuralizer.bst
- legacy/glow.bst
- legacy/onnxruntime.bst
- legacy/onnxruntime-genai.bst
# Essential programs
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
# Hugging Face cli for fetching models
- deps/python3-huggingface_hub.bst
# friendly items for usability and debugging below
- legacy/python3-site-nekko.bst
- legacy/ldconfig-nekko.bst
- legacy/gdbinit-nekko.bst
- base/freedesktop-sdk.bst:integration/ldconfig.bst
- base/freedesktop-sdk.bst:integration/app-debug-link.bst
- base/freedesktop-sdk.bst:integration/extra-fs.bst
- base/freedesktop-sdk.bst:components/bash-config.bst
- legacy/bash-profile-nekko.bst
- base/freedesktop-sdk.bst:components/patchelf.bst
- base/freedesktop-sdk.bst:components/gdb.bst
- base/freedesktop-sdk.bst:components/vim.bst
- base/freedesktop-sdk.bst:components/less.bst
- base/freedesktop-sdk.bst:components/bzip2.bst
