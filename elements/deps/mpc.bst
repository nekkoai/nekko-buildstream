kind: autotools

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:components/texinfo.bst

depends:
- base/freedesktop-sdk.bst:components/mpfr.bst

#public:
#  bst:
#    integration-commands:
#    - ldconfig

sources:
- kind: git
  url: inria:mpc/mpc
  track: master
  ref: 06b0dd15afd98a5eb19776e066b6184daee7a862
