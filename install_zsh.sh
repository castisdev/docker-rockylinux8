#!/bin/sh -e
set -x #echo on
dnf install -y util-linux-user zsh
dnf -y clean all
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
