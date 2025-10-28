kind: autotools

description: |

  Builds and installs Open-Source GCC RISC-V toolchain.
  This is installed into `/opt/toolchain`.

depends:
- base/freedesktop-sdk.bst:public-stacks/buildsystem-autotools.bst
- base/freedesktop-sdk.bst:public-stacks/buildsystem-python.bst

build-depends:
- base/freedesktop-sdk.bst:components/autoconf.bst
- base/freedesktop-sdk.bst:components/bc.bst
- base/freedesktop-sdk.bst:components/bison.bst
- base/freedesktop-sdk.bst:components/curl.bst
- base/freedesktop-sdk.bst:components/expat.bst
- base/freedesktop-sdk.bst:components/flex.bst
- base/freedesktop-sdk.bst:components/gperf.bst
- base/freedesktop-sdk.bst:components/git.bst
- base/freedesktop-sdk.bst:components/glib.bst
- base/freedesktop-sdk.bst:components/gmp.bst
- base/freedesktop-sdk.bst:components/libslirp.bst
- base/freedesktop-sdk.bst:components/mpfr.bst
- base/freedesktop-sdk.bst:components/patch.bst
- base/freedesktop-sdk.bst:components/texinfo.bst
- base/freedesktop-sdk.bst:components/util-linux-full.bst
- base/freedesktop-sdk.bst:components/zlib.bst
- deps/python3-tomli.bst
- deps/mpc.bst

sources:
- kind: git
  url: github:aifoundry-org/riscv-gnu-toolchain
  ref: 2025.10.15-0-g78e41dce7f68588da3406d6470beac0eba962b13

variables:
  prefix: "%{install-root}/opt/et"
  conf-local: "--with-arch=rv64imfc --with-abi=lp64f --with-languages=c,c++ --with-cmodel=medany"

config:
  configure-commands:
    (>):
      - |
        #
        # cd $(srcdir) && \
        #  flock `git rev-parse --git-dir`/config git submodule update --progress --depth 1 $(dir $@)
        #  flock `git rev-parse --git-dir`/config git submodule init $(dir $@) && \
        #
        # This is a hack to remove the section above from Makefile.in.
        # This is needed as the `flock` command requires write access to `/config`,
        # which can't be given since BST is a read-only filesystem.
        # This lines aren't needed as the submodules are auto pulled in already.
        sed -i '346d;347d' Makefile.in
        sed -i '345s/ && \\//' Makefile.in

  strip-commands:
  - |
    # freedesktop-sdk-stripper is failing here, so temp fix is to just disable this for now.
