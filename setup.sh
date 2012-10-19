#!/bin/bash

DOT_FILES=( .ackrc .gitignore .gitconfig .gvimrc .screenrc .tmux.conf .vimperatorrc .vimrc .zshrc .zshrc.mine .zshrc.alias .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

case "${OSTYPE}" in
freebsd*|darwin*)
  ln -s $HOME/dotfiles/.zshrc.mac $HOME/.zshrc.mac
  ;;
esac
