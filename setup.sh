#!/bin/bash
set -e

echo -e -n "\033[1;37mRick Button's dotfiles\n\n"

FILES=( "gitconfig:$HOME/.gitconfig"
        "gitignore_global:$HOME/.gitignore_global"
        "rick.zsh-theme:$HOME/.oh-my-zsh/themes/rick.zsh-theme"
        "tmux.conf:$HOME/.tmux.conf"
        "vimrc:$HOME/.vimrc"
        "zshrc:$HOME/.zshrc" 
        "bin/git_diff_wrapper:$HOME/bin/git_diff_wrapper"
        "vim:$HOME/.vim"
        "bin/upload.py:$HOME/bin/upload.py"
        "bin/volume.sh:$HOME/bin/volume.sh"
        "bin/t:$HOME/bin/t"
        "bin/gforge-session:$HOME/bin/gforge-session")

unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  
  echo -e -n "\033[1;36mOS is Mac OSX\n"
elif [[ "$unamestr" == 'Linux' ]]; then
  FILES+=("Xdefaults:$HOME/.Xdefaults")
  FILES+=("xmobarrc:$HOME/.xmobarrc")
  FILES+=("Xmodmap:$HOME/.Xmodmap")
  FILES+=("xmonad:$HOME/.xmonad")
  FILES+=("xinitrc:$HOME/.xinitrc")

  FILES+=("bin/ynab:$HOME/bin/ynab")
  FILES+=("bin/word:$HOME/bin/word")

  echo -e -n "\033[1;36mOS is Linux\n"
fi

echo -e -n "\n"

FOLDERS=( "$HOME/bin" )

echo -e -n "\033[1;36mCreating folders...\n"
for d in "${FOLDERS[@]}" ; do
  VALUE=${d}
  echo -e -n "\033[1;32m$VALUE\n"
  rm -rf $VALUE
  mkdir -p $VALUE
done
echo -e -n "\n"
echo -e -n "\033[1;36mSymlinking files...\n"
for f in "${FILES[@]}" ; do
  KEY=${f%%:*}
  VALUE=${f#*:}
  echo -e -n "\033[1;32m$PWD/$KEY -> $VALUE\n"
  rm -rf $VALUE
  ln -s $PWD/$KEY $VALUE
done

echo -e -n "\n"
echo -e -n "\033[1;37mDone.\n"
