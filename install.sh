#!/bin/bash

FOLDER=$(pwd)

if [ -d "$FOLDER/.git" ]; then
  rm ~/.bashrc
  ln -s $FOLDER/.bashrc ~/.bashrc
  rm ~/.gitconfig
  ln -s $FOLDER/.gitconfig ~/.gitconfig
  rm ~/.nvimrc
  ln -s $FOLDER/.vimrc ~/.nvimrc
  rm ~/.vimrc
  ln -s $FOLDER/.vimrc ~/.vimrc
  rm ~/.tmux.conf
  ln -s $FOLDER/.tmux.conf ~/.tmux.conf
  rm ~/.gdbinit
  ln -s $FOLDER/.gdbinit ~/.gdbinit
fi

if [ -d "~/.vim/bundle/Vundle.vim" ] ; then
    echo "vundle for vim already installed"
else 
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


