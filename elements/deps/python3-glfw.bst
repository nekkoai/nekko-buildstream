kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/glfw.bst

sources:
- kind: git_repo
  url: github:FlorianRhiem/pyGLFW
  track: master
  ref: v2.10.0-0-g920994d4260d8fc59e634e4b4000069b2699e44f
