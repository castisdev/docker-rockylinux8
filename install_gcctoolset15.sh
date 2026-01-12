#!/bin/bash -e
set -x #echo on
dnf install -y gcc-toolset-15 gcc-toolset-15-gcc-c++ gcc-toolset-15-binutils gcc-toolset-15-libquadmath-devel gcc-toolset-15-libasan-devel gcc-toolset-15-liblsan-devel gcc-toolset-15-libtsan-devel gcc-toolset-15-libubsan-devel
dnf clean all -y
