#!/bin/bash

DOT_FILES=( .ackrc .gitignore .gvimrc .screenrc .tmux.conf .vimperatorrc .vimrc .zshrc .zshrc.mine .zshrc.alias)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
