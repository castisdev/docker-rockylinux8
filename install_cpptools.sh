#!/bin/sh -e
set -x #echo on

cd ~
dnf install -y python3-pip
dnf clean all -y
pip3 install gcovr cpplint
