# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rick"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler brew gem)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

alias tmux='TERM=screen-256color-bce tmux'

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# RBENV
export PATH="$HOME/bin:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# GCC CROSS COMPILER
export PATH=/usr/local/cross/bin:$PATH

#NODE
export PATH=/usr/local/share/npm/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Local bin
export PATH="~/bin/:$PATH"

unamestr=`uname`
#OSX Specific config
if [[ "$unamestr" == 'Darwin' ]]; then
  alias vim='mvim'
  #JAVA
  export JAVA_HOME=$(/usr/libexec/java_home)

  # ANDROID SDK
  export PATH="$HOME/tools/android-sdk-macosx/tools:$HOME/tools/android-sdk-macosx/platform-tools:$PATH"

  # PYTHON
  export PATH=/usr/local/share/python:$PATH

  # GO
  export GOROOT=/usr/local/go
  export GOPATH=~/code/golib:~/code/godev
  export PATH=$GOROOT/bin:$PATH
elif [[ "$unamestr" == 'Linux' ]]; then
  #JAVA
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle

  # Go Lang
  export GOPATH=~/code/golib:~/code/godev
  export PATH=~/code/golib/bin:~/code/godev/bin:$PATH
fi
