kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:termcolor/termcolor
  track: main
  ref: 3.1.0-10-ge923aea7f282a2a8adb60e5f316528f0b6c277f7
