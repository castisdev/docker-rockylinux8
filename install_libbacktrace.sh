#!/bin/bash -e
set -x #echo on
source ${BUILD_TOOLSET_ENABLE}
cd ~
git clone https://github.com/ianlancetaylor/libbacktrace.git
cd libbacktrace
CFLAGS=-fPIC ./configure
make install -j$(nproc)
cd ~
rm -rf libbacktrace
