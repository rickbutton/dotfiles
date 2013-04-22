#!/bin/bash

FILES=( "gitconfig:$HOME/.gitconfig"
        "gitignore_global:$HOME/.gitignore_global"
        "rick.zsh-theme:$HOME/.oh-my-zsh/themes/rick.zsh-theme"
        "tmux.conf:$HOME/.tmux.conf"
        "vimrc:$HOME/.vimrc"
        "zshrc:$HOME/.zshrc" 
        "git_diff_wrapper:$HOME/bin/git_diff_wrapper"
        "vim:$HOME/.vim")

mkdir -p $HOME/bin

for animal in "${FILES[@]}" ; do
  KEY=${animal%%:*}
  VALUE=${animal#*:}
  rm -rf $VALUE
  ln -s $PWD/$KEY $VALUE
done
