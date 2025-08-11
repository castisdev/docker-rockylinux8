#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
wget -nv --content-disposition https://github.com/google/googletest/archive/refs/tags/v1.17.0.tar.gz
tar xvf googletest-1.17.0.tar.gz
cd googletest-1.17.0/
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf googletest-1.17.0.tar.gz googletest*
