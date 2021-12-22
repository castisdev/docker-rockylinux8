#!/bin/bash -e
set -x #echo on
yum install -y gcc-toolset-11 gcc-toolset-11-gcc-c++ gcc-toolset-11-binutils gcc-toolset-11-libquadmath-devel gcc-toolset-11-gdb gcc-toolset-11-gdb-gdbserver gcc-toolset-11-perftools gcc-toolset-11-libasan-devel gcc-toolset-11-liblsan-devel gcc-toolset-11-libtsan-devel gcc-toolset-11-libubsan-devel; yum clean all -y
