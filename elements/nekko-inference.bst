kind: stack

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- platform/device-management-application.bst
- inference/llama.bst
- inference/python3-tinygrad.bst
# Hugging Face cli for fetching models
- deps/python3-huggingface_hub.bst
# friendly items for usability and debugging below
- legacy/python3-site-nekko.bst
- legacy/ldconfig-nekko.bst
- legacy/gdbinit-nekko.bst
- legacy/bash-profile-nekko.bst
- base/freedesktop-sdk.bst:integration/ldconfig.bst
- base/freedesktop-sdk.bst:integration/extra-fs.bst
- base/freedesktop-sdk.bst:components/bash-config.bst
- base/freedesktop-sdk.bst:components/less.bst
