kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

sources:
- kind: git_repo
  url: github:ifduyue/python-xxhash
  track: master
  ref: v3.6.0-8-g1d147bae5ab866665e5076fdc65b05178485559f
- kind: git_module
  path: deps/xxhash
  url: github:Cyan4973/xxHash
  ref: bbb27a5efb85b92a0486cf361a8635715a53f6ba
