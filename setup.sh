#!/bin/bash

FILES=( "gitconfig:$HOME/.gitconfig"
        "gitignore_global:$HOME/.gitignore_global"
        "rick.zsh-theme:$HOME/.oh-my-zsh/themes/rick.zsh-theme"
        "tmux.conf:$HOME/.tmux.conf"
        "vimrc:$HOME/.vimrc"
        "zshrc:$HOME/.zshrc" )

for animal in "${FILES[@]}" ; do
  KEY=${animal%%:*}
  VALUE=${animal#*:}
  rm -rf $VALUE
  ln -s $PWD/$KEY $VALUE
done
