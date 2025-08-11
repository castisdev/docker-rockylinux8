#!/bin/bash -e
set -x #echo on
dnf install -y gcc-toolset-14 gcc-toolset-14-gcc-c++ gcc-toolset-14-binutils gcc-toolset-14-libquadmath-devel gcc-toolset-14-libasan-devel gcc-toolset-14-liblsan-devel gcc-toolset-14-libtsan-devel gcc-toolset-14-libubsan-devel
dnf clean all -y
