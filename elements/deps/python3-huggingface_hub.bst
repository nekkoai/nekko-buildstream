kind: pip

build-depends:
- base/freedesktop-sdk.bst:sdk.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-maturin.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst
- base/freedesktop-sdk.bst:components/python3-filelock.bst
- deps/python3-numpy.bst
- deps/python3-hf_xet.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst
- base/freedesktop-sdk.bst:components/python3-filelock.bst
- deps/python3-hf_xet.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git
  url: github:huggingface/huggingface_hub
  track: v0.35.0
  ref: 0f12365eb66305b280a7a3b65c48faf9f24f8c20
- kind: pip
  packages:
  - tqdm
  - fsspec
  ref: "tqdm==4.67.1\nfsspec==2025.9.0"
