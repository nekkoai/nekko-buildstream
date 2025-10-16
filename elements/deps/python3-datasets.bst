kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-pyarrow.bst
- deps/python3-xxhash.bst
- deps/python3-httpx.bst
- deps/python3-multiprocess.bst
- deps/python3-jsonlines.bst
- deps/python3-dill.bst

# lerobot 0.3.3 is only compatible with datasets 3.6.0
sources:
- kind: git_repo
  url: github:huggingface/datasets
  track: 3.6.0
  ref: 3.6.0-0-g458f45a22c3cc9aea5f442f6f519333dcfeae9b9
