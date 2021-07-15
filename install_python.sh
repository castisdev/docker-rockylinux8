#!/bin/sh -e
set -x #echo on
yum module install -y python39
pip3 install -U pip setuptools websocket-client
