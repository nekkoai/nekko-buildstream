kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/ffmpeg.bst
- deps/python3-numpy.bst
- deps/python3-pillow.bst
- deps/python3-torch.bst
- deps/python3-av.bst

environment:
  I_CONFIRM_THIS_IS_NOT_A_LICENSE_VIOLATION: true
  TORCHCODEC_DISABLE_COMPILE_WARNING_AS_ERROR: true

sources:
- kind: git_repo
  url: github:meta-pytorch/torchcodec
  track: v0.7.0
  ref: v0.7.0-0-g7dd6092b40a76a262b633c591d8edb6ce0a86c11
