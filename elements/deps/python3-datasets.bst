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

sources:
- kind: git_repo
  url: github:huggingface/datasets
  track: 4.2.0
  ref: 4.2.0-0-g7e1350b41d19eabc961e7de9e26f1aa09f18e110
