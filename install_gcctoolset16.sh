#!/bin/bash -e
set -x #echo on
dnf install -y gcc-toolset-16 gcc-toolset-16-gcc-c++ gcc-toolset-16-binutils gcc-toolset-16-libquadmath-devel gcc-toolset-16-libasan-devel gcc-toolset-16-liblsan-devel gcc-toolset-16-libtsan-devel gcc-toolset-16-libubsan-devel
dnf clean all -y
