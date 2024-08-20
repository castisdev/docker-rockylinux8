#!/bin/sh -e
set -x #echo on
yum install -y python3.12 python3.12-pip
pip3 install -U pip setuptools websocket-client
