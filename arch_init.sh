#!/bin/bash

prefix="/home/freedomDR"
install_path="${prefix}/software"
echo $prefix
echo $install_path

cur_pwd=`pwd`
cd $prefix

# note: need set proxy eg. export HTTP_PROXY HTTPS_PROXY ALL_PROXY

# install neovim and build from source code
pacman -Syu --disable-download-timeout base-devel cmake unzip ninja tree-sitter curl
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$install_path
make install

cd $cur_pwd



