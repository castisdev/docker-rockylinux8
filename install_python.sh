#!/bin/sh -e
set -x #echo on
dnf install -y python3.12 python3.12-pip
dnf -y clean all
pip3 install -U pip setuptools websocket-client
