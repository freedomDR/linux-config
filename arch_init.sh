#!/bin/bash

set -x

prefix="/home/freedomDR"
pacman -Syu neovim
pacman -Syu git
pacman -Syu tmux
pacman -Syu github-cli

git config --global user.email "1640145602@qq.com"
git config --global user.name "freedomDR"
git config --global core.editor "nvim"
# 配置token
gh auth login


# https://www.ipaddress.com/ 获取ip地址 修改/etc/hosts即可
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh 
git clone https://github.com/gpakosz/.tmux.git $prefix/oh-my-tmux
ln -s -f $prefix/oh-my-tmux/.tmux.conf ~/.tmux.conf
cp $prefix/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local



#install_path="${prefix}/software"
#echo $prefix
#echo $install_path

#cur_pwd=`pwd`
#cd $prefix

# note: need set proxy eg. export HTTP_PROXY HTTPS_PROXY ALL_PROXY

# install neovim and build from source code
#pacman -Syu --disable-download-timeout base-devel cmake unzip ninja tree-sitter curl
#git clone https://github.com/neovim/neovim.git
#cd neovim
#make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=$install_path
#make install

#cd $cur_pwd



