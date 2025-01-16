#!/bin/bash -e
cd ~
yum -y install ncurses-devel; yum -y clean all
wget -nv --no-check-certificate https://cmake.org/files/v3.9/cmake-3.9.6.tar.gz
tar xzf cmake-3.9.6.tar.gz
cd cmake-3.9.6
./configure
make install -j$(nproc)
cmake --version
cd ~
rm -rf cmake-*
