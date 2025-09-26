kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/python3-hatch-fancy-pypi-readme.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-attrs.bst
- deps/python3-referencing.bst
- deps/python3-jsonschema-specifications.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "4.25.1"

sources:
- kind: git
  url: github:python-jsonschema/jsonschema
  track: v4.25.1
  ref: 331c38425519b69118d22ebe467ad230fb83a010
