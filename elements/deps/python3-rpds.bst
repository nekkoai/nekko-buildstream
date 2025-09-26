kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:components/python3-maturin.bst

depends:
- base/freedesktop-sdk.bst:components/python3.bst

# TODO figure out how to get this dynamically?  guess_version??
environment:
  SETUPTOOLS_SCM_PRETEND_VERSION: "0.27.1"

sources:
- kind: git
  url: github:crate-py/rpds
  track: v0.27.1
  ref: 7ecc7a56108a64383fe5fbf5c0ca08a6f797db18
- kind: cargo
  cargo-lock: Cargo.lock
  ref:
  - name: archery
    version: 1.2.1
    sha: eae2ed21cd55021f05707a807a5fc85695dafb98832921f6cfa06db67ca5b869
  - name: autocfg
    version: 1.4.0
    sha: ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26
  - name: cc
    version: 1.2.25
    sha: d0fc897dc1e865cc67c0e05a836d9d3f1df3cbe442aa4a9473b18e12624a4951
  - name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - name: indoc
    version: 2.0.6
    sha: f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd
  - name: libc
    version: 0.2.172
    sha: d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa
  - name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - name: portable-atomic
    version: 1.11.0
    sha: 350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e
  - name: proc-macro2
    version: 1.0.95
    sha: 02b3e5e68a3a1a02aad3ec490a98007cbc13c37cbe84a3cd7b8e406d76e7f778
  - name: pyo3
    version: 0.25.1
    sha: 8970a78afe0628a3e3430376fc5fd76b6b45c4d43360ffd6cdd40bdde72b682a
  - name: pyo3-build-config
    version: 0.25.1
    sha: 458eb0c55e7ece017adeba38f2248ff3ac615e53660d7c71a238d7d2a01c7598
  - name: pyo3-ffi
    version: 0.25.1
    sha: 7114fe5457c61b276ab77c5055f206295b812608083644a5c5b2640c3102565c
  - name: pyo3-macros
    version: 0.25.1
    sha: a8725c0a622b374d6cb051d11a0983786448f7785336139c3c94f5aa6bef7e50
  - name: pyo3-macros-backend
    version: 0.25.1
    sha: 4109984c22491085343c05b0dbc54ddc405c3cf7b4374fc533f5c3313a572ccc
  - name: python3-dll-a
    version: 0.2.14
    sha: d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8
  - name: quote
    version: 1.0.40
    sha: 1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d
  - name: rpds
    version: 1.1.1
    sha: a7f89f654d51fffdd6026289d07d1fd523244d46ae0a8bc22caa6dd7f9e8cb0b
  - name: shlex
    version: 1.3.0
    sha: 0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64
  - name: syn
    version: 2.0.101
    sha: 8ce2b7fc941b3a24138a0a7cf8e858bfc6a992e7978a068a5c760deb0ed43caf
  - name: target-lexicon
    version: 0.13.2
    sha: e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a
  - name: triomphe
    version: 0.1.14
    sha: ef8f7726da4807b58ea5c96fdc122f80702030edc33b35aff9190a51148ccc85
  - name: unicode-ident
    version: 1.0.18
    sha: 5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512
  - name: unindent
    version: 0.2.4
    sha: 7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3
