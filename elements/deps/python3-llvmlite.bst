kind: pip

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/llvm.bst

variables:
  pip-flags: |
    %{pip} install --no-build-isolation --no-deps --root=%{install-root} --prefix=%{prefix}

environment:
  LLVMLITE_SKIP_LLVM_VERSION_CHECK: on
  LLVMLITE_CXX_STATIC_LINK: on
  LLVMLITE_SHARED: off

# TODO: Upstream doesn't support LLVM 21 yet, so resolve these LLVM API changes:
# https://github.com/llvm/llvm-project/pull/130192 - Remove -forder-file-instrumentation
# https://github.com/llvm/llvm-project/pull/142811 - [MemProf] Split MemProfiler into Instrumentation and Use.
# https://github.com/llvm/llvm-project/commit/f905bf3e1ef860c4d6fe67fb64901b6bbe698a91 - [ORC] Remove the Triple argument from LLJITBuilder::ObjectLinkingLayerCreator.
# https://github.com/llvm/llvm-project/pull/132933/files - Lint: Replace -lint-abort-on-error cl::opt with pass parameter
sources:
- kind: git_repo
  url: github:numba/llvmlite
  track: main
  ref: v0.46.0b1-14-g7c0e103ffeab6d8d877d8c90cde5fd0aa7be890c
- kind: patch_queue
  path: static/patches/llvmlite
