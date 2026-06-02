#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
wget -nv --no-check-certificate https://github.com/weidai11/cryptopp/releases/download/CRYPTOPP_8_9_0/cryptopp890.zip
unzip cryptopp890.zip -d cryptopp
cd cryptopp
make static -j$(nproc)
make install -j$(nproc)
cd ~
rm -rf cryptopp*
