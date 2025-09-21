kind: pyproject

build-depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python-maturin.bst
- base/freedesktop-sdk.bst:components/openssl.bst
- base/freedesktop-sdk.bst:components/pkg-config.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst

depends:
- base/freedesktop-sdk.bst:components/openssl.bst
- base/freedesktop-sdk.bst:components/python3.bst
- base/freedesktop-sdk.bst:components/python3-pyyaml.bst
- base/freedesktop-sdk.bst:components/python3-requests.bst
- base/freedesktop-sdk.bst:components/python3-urllib3.bst

variables:
  command-subdir: bindings/python

sources:
- kind: git
  url: github:huggingface/safetensors
  track: v0.6.2
  ref: aa6c43d729868fc43918e862d42bfeaf60485d1d
- kind: cargo
  cargo-lock: bindings/python/Cargo.lock
  ref:
  - name: autocfg
    version: 1.5.0
    sha: c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8
  - name: heck
    version: 0.5.0
    sha: 2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea
  - name: indoc
    version: 2.0.6
    sha: f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd
  - name: itoa
    version: 1.0.15
    sha: 4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c
  - name: libc
    version: 0.2.174
    sha: 1171693293099992e19cddea4e8b849964e9846f4acee11b3948bcc337be8776
  - name: memchr
    version: 2.7.5
    sha: 32a282da65faaf38286cf3be983213fcf1d2e2a58700e808f83f4ea9a4804bc0
  - name: memmap2
    version: 0.9.5
    sha: fd3f7eed9d3848f8b98834af67102b720745c4ec028fcd0aa0239277e7de374f
  - name: memoffset
    version: 0.9.1
    sha: 488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a
  - name: once_cell
    version: 1.21.3
    sha: 42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d
  - name: portable-atomic
    version: 1.11.1
    sha: f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483
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
  - name: quote
    version: 1.0.40
    sha: 1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d
  - name: ryu
    version: 1.0.20
    sha: 28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f
  - name: serde
    version: 1.0.219
    sha: 5f0e2c6ed6606019b4e29e69dbaba95b11854410e5347d525002456dbbb786b6
  - name: serde_derive
    version: 1.0.219
    sha: 5b0276cf7f2c73365f7157c8123c21cd9a50fbbd844757af28ca1f5925fc2a00
  - name: serde_json
    version: 1.0.140
    sha: 20068b6e96dc6c9bd23e01df8827e6c7e1f2fddd43c21810382803c136b99373
  - name: syn
    version: 2.0.104
    sha: 17b6f705963418cdb9927482fa304bc562ece2fdd4f616084c50b7023b435a40
  - name: target-lexicon
    version: 0.13.2
    sha: e502f78cdbb8ba4718f566c418c52bc729126ffd16baee5baa718cf25dd5a69a
  - name: unicode-ident
    version: 1.0.18
    sha: 5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512
  - name: unindent
    version: 0.2.4
    sha: 7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3
