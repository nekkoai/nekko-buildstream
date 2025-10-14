kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-rpds.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.36.2"

sources:
- kind: git_repo
  url: github:python-jsonschema/referencing
  track: v0.36.2
  ref: 9a82e6c7e5e2e395b61bb4017dc6adc52ac52e7c
