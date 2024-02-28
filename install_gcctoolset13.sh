#!/bin/bash -e
set -x #echo on
yum install -y gcc-toolset-13 gcc-toolset-13-gcc-c++ gcc-toolset-13-binutils gcc-toolset-13-libquadmath-devel gcc-toolset-13-gdb gcc-toolset-13-libasan-devel gcc-toolset-13-liblsan-devel gcc-toolset-13-libtsan-devel gcc-toolset-13-libubsan-devel; yum clean all -y
