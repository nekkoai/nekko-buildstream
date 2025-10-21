kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/sdl3.bst
- base/freedesktop-sdk.bst:components/python3-psutil.bst
- deps/python3-draccus.bst
- deps/python3-mergedeep.bst
- deps/python3-typing-inspect.bst
- deps/python3-datasets.bst
- deps/python3-mypy-extensions.bst
- deps/python3-pandas.bst
- deps/python3-diffusers.bst
- deps/python3-torchvision.bst
- deps/python3-torchcodec.bst
- deps/python3-imageio.bst
- deps/python3-av.bst
- deps/python3-serial.bst
- deps/python3-deepdiff.bst
- deps/python3-num2words.bst
- deps/python3-einops.bst
- deps/python3-gymnasium.bst
- deps/python3-accelerate.bst
- deps/python3-termcolor.bst
- deps/python3-opencv.bst
- deps/python3-libero.bst
- deps/python3-pyopengl_accelerate.bst

#  url: github:huggingface/lerobot
#  track: v0.3.3
#  url: github:aifoundry-org/lerobot
#  track: 0.3.4
sources:
- kind: git
  url: github:aifoundry-org/lerobot
  track: main
  ref: 845b359d390b4c4f53c0560a8009e6d3ce7b88e1
