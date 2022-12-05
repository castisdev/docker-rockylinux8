#!/bin/bash -e
set -x #echo on
yum install -y gcc-toolset-12 gcc-toolset-12-gcc-c++ gcc-toolset-12-binutils gcc-toolset-12-libquadmath-devel gcc-toolset-12-gdb gcc-toolset-12-libasan-devel gcc-toolset-12-liblsan-devel gcc-toolset-12-libtsan-devel gcc-toolset-12-libubsan-devel; yum clean all -y
