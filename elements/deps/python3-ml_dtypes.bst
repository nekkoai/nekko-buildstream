kind: pyproject

# TODO: So...this package depends upon Eigen 5+ ... it's header-only, so eh.
build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- deps/eigen5.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- deps/python3-numpy.bst

sources:
- kind: git_repo
  url: github:jax-ml/ml_dtypes
  track: main
  ref: v0.5.3-6-g3100a5321b25293adfdd58f8f41713accff6288b
- kind: patch
  path: static/patches/ml_dtypes-setuptools-eigen5.patch
