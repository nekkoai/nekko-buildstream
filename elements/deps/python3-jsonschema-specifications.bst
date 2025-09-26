kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-referencing.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "2025.9.1"

sources:
- kind: git
  url: github:python-jsonschema/jsonschema-specifications
  track: v2025.9.1
  ref: 3b846010c34ce254d8ced23023451d1d64de37f5
