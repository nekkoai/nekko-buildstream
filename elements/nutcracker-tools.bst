kind: stack

depends:
- base/freedesktop-sdk.bst:public-stacks/runtime-minimal.bst
- platform/device-management-application.bst
# friendly items for usability and debugging below
- legacy/ldconfig-nekko.bst
- legacy/bash-profile-nekko.bst
- base/freedesktop-sdk.bst:integration/ldconfig.bst
