kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-typing-extensions.bst
- deps/python3-numpy.bst
- deps/python3-cloudpickle.bst
- deps/python3-farama-notifications.bst

sources:
- kind: git_repo
  url: github:Farama-Foundation/Gymnasium
  track: main
  ref: v1.2.1-3-g20460c5be7b143b53b9599eeff43185e528f62b6
