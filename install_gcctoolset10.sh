#!/bin/bash -e
set -x #echo on
yum install -y gcc-toolset-10 gcc-toolset-10-gcc-c++ gcc-toolset-10-binutils gcc-toolset-10-libquadmath-devel gcc-toolset-10-gdb gcc-toolset-10-gdb-gdbserver gcc-toolset-10-perftools gcc-toolset-10-libasan-devel gcc-toolset-10-liblsan-devel gcc-toolset-10-libtsan-devel gcc-toolset-10-libubsan-devel; yum clean all -y
