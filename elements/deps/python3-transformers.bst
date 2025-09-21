kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-maturin.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst
- base/freedesktop-sdk.bst:components/python3-jinja2.bst
- deps/python3-numpy.bst
- deps/python3-hf_xet.bst
- deps/python3-huggingface_hub.bst
- deps/python3-safetensors.bst
- deps/python3-tokenizers.bst
- deps/python3-regex.bst
- deps/python3-torch.bst
- deps/python3-sympy.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-jinja2.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst
- deps/python3-hf_xet.bst
- deps/python3-huggingface_hub.bst
- deps/python3-safetensors.bst
- deps/python3-tokenizers.bst
- deps/python3-regex.bst
- deps/python3-torch.bst
- deps/python3-sympy.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix} .[torch]

sources:
- kind: git_repo
  url: github:huggingface/transformers
  track: v4.56.2
  ref: cd74917ffc3e8f84e4a886052c5ab32b7ac623cc
