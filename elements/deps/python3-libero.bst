kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-robosuite.bst
- deps/python3-robosuite-models.bst
- deps/python3-bddl.bst
- deps/python3-easydict.bst
- deps/python3-matplotlib.bst

sources:
- kind: git_repo
  url: github:huggingface/lerobot-libero
  track: main
  ref: 48929baa4712183c90593ebb6aad7b5db27fcd2e
