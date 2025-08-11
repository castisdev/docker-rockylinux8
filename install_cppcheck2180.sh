#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
dnf -y install bzip2
dnf -y clean all
wget -nv --no-check-certificate --content-disposition https://github.com/danmar/cppcheck/archive/2.18.0.tar.gz
tar xf cppcheck-2.18.0.tar.gz
cd cppcheck-2.18.0
mkdir build;cd build;cmake ..;make install -j$(nproc)
cd ~
rm -rf cppcheck*
