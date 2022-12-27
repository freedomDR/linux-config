#!/bin/bash

set -x

prefix="/root"
cur_director=`pwd`
#It is possible no man entry. need midify /etc/pacman.conf comment /usr/share/man
pacman-key --init
pacman -Sy archlinux-keyring
pacman -Syu man-db
pacman -Syu man-pages
pacman -S $(pacman -Qq $(pacman -Fq /usr/share/man/ | cut -d/ -f2) 2> /dev/null)
pacman -Syu git
pacman -Syu ack
pacman -Syu zsh
pacman -Syu neovim
pacman -Syu tmux
pacman -Syu github-cli
pacman -Syu nodejs
pacman -Syu npm
pacman -Syu clang

# init nvim
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim

git config --global user.email "1640145602@qq.com"
git config --global user.name "freedomDR"
git config --global core.editor "nvim"
# 配置git token
gh auth login


# https://www.ipaddress.com/ 获取ip地址 修改/etc/hosts即可
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh
git clone https://github.com/gpakosz/.tmux.git $prefix/oh-my-tmux
ln -s -f $prefix/oh-my-tmux/.tmux.conf ~/.tmux.conf
ln -s -f $cur_director/.tmux_conf.local ~/.tmux.conf.local

# install my vimrc (fork from amix/vimrc)
git clone --depth=1 https://github.com/freedomDR/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# cocvim
# CocInstall coc-json
# CocInstall coc-clangd
# CocInstall coc-pyright
# TODO: save Coc config file
# https://github.com/neoclide/coc.nvim





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



