#!/bin/sh -e
set -x #echo on
yum install -y python3.11 python3.11-pip
pip3 install -U pip setuptools websocket-client
