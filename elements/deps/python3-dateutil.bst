kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:dateutil/dateutil
  track: master
  ref: 2.9.0.post0-7-ge081f6725fbb49cae6eedab7010f517e8490859b
- kind: patch
  path: static/patches/python3-dateutil-pyproject.patch
