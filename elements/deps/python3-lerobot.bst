kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

runtime-depends:
- base/freedesktop-sdk.bst:components/sdl3.bst
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

sources:
- kind: git_repo
  url: github:huggingface/lerobot
  track: v0.3.3
  ref: v0.3.3-0-gb883328e6c95681ca90a18b102e4ae5e1f91e2bf
