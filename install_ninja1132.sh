#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
wget -nv --no-check-certificate --content-disposition https://github.com/skvadrik/re2c/releases/download/4.4/re2c-4.4.tar.xz
tar xvf re2c-4.4.tar.xz
cd re2c-4.4
mkdir .build && cd .build && cmake .. && cmake --build . -j$(nproc) --target install
cd ~
rm -rf re2c-4.4*

wget -nv https://github.com/ninja-build/ninja/archive/refs/tags/v1.13.2.tar.gz --no-check-certificate --content-disposition
tar xvf ninja-1.13.2.tar.gz
cd ninja-1.13.2
alternatives --set python /usr/bin/python3
./configure.py --bootstrap
install ninja /usr/local/bin
cd ~
rm -rf ninja-*
