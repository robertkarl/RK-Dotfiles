#! /usr/bin/env sh
VIM_BACKUP=".vimrc-$(uname -n).backup"
echo "Will copy ~/.vimrc to ${VIM_BACKUP}"
cp ~/.vimrc $VIM_BACKUP
cp .vimrc ~/.vimrc

