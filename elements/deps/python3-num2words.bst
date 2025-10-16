kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

sources:
- kind: git_repo
  url: github:savoirfairelinux/num2words
  track: master
  ref: v0.5.14-12-g07814cb114157f582c40a00119c2e9faba8dcee2
