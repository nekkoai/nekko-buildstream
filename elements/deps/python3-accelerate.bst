kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-psutil.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- deps/python3-numpy.bst
- deps/python3-torch.bst
- deps/python3-safetensors.bst
- deps/python3-huggingface_hub.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

sources:
- kind: git_repo
  url: github:huggingface/accelerate
  track: main
  ref: v0.13.0-0-g5998f8625b8dfde9253c241233ff13bc2c18635d
