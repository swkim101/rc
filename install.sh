#!/bin/bash

# check git
command -v git >/dev/null 2>&1 || { echo >&2 "Cannot find git.  Aborting."; exit 1; }

# Install Vundle
GIT=$(command -v git)
$GIT clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Backup .vimrc if exist
if [ -f ~/.vimrc ]; then
  echo 'cp ~/.vimrc ~/.vimrc.old'
  cp ~/.vimrc ~/.vimrc.old
fi

wget https://raw.githubusercontent.com/swkim101/rc/master/vimrc -O ~/.vimrc
curl https://raw.githubusercontent.com/swkim101/rc/master/bashrc >> ~/.bashrc

#Install Plugins
source ~/.bashrc
vim +PluginInstall +qall
