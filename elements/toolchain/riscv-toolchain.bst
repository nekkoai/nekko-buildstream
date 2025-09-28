kind: import

depends:
- toolchain/riscv-toolchain-cmake.bst
- deps/mpc.bst

# Fetch the precompiled compiler binaries
#
# This URL should be available via the tailnet - otherwise, extract it to static/gnu and switch to local
#
# This tar file was created on an Ubuntu 24.04 image with:
#
# ./configure --prefix=/home/ubuntu/work/et-gnu-toolchain
#     --with-arch=rv64imfc --with-abi=lp64f --with-languages=c,c++ --with-cmodel=medany --enable-strip
#
# url: github:nekkoai/et-riscv-gnu-toolchain
# track: et
# ref: 156d6982189fa294a6cbad10b8a0a28fb581acaf
#
# url: http://cassian/dist/et-gnu-toolchain-0.2.0.tar.gz
# ref: 3d7cb577ca34c8ba6d2e467bfd0c90de1730cb48be2e8133453fdb4d7697df9c
#
# url: http://cassian/dist/et-gnu-toolchain-0.3.0.tar.gz
# ref: ba187ad49f8e996029504365ac18ae9d9ea7a6c06cd43d1016eb603176cf95ab
#
#- kind: local
#  path: static/gnu

sources:
- kind: docker
  registry-url: https://ghcr.io
  image: nekkoai/et-gnu-toolchain
  track: v0.3.0
  ref: b93ee595a3a5144499890c237d1e23e1e4549c5b20786928f0beebe72fbaf769
config:
  target: /opt/toolchain/gnu
