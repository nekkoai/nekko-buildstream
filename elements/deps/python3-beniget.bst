kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:serge-sans-paille/beniget
  track: 0.4.2.post1
  ref: 40d39542589d7ed6f9b881931b310c227b682b0b
