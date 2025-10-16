kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-future.bst
- deps/python3-iso8601.bst

sources:
- kind: pypi
  name: serial
  ref:
    sha256sum: 542150a127ddbf5ed2acc3a6ac4ce807cbcdae3b197acf785bbda6565c94f848
    suffix: 9b/05/54c6fb8861d973ded4bc16f2cd4d85582a97c6fff81320dc1a281995cecc/serial-0.0.97.tar.gz
