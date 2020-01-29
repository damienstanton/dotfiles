##########
# +----+ #
# | DS | #
# +----+ #
##########

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh
DEFAULT_USER="damien"
ZSH_THEME="ds"
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1
plugins=(git dirhistory docker git-extras gradle node npm osx pip sudo wd vi-mode)

source $HOME/zsh/lang.sh
source $ZSH/oh-my-zsh.sh


# Scripts
export PATH="$HOME/work/scripts:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Cargo-installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Pip-installed binaries
export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Java
# GraalVM
# export JAVA_HOME="$HOME/graal/Contents/Home"
# export PATH="$HOME/graal/Contents/Home/bin:$PATH"

# System Java
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"

# Go
export PATH="$HOME/.gvm/bin:$PATH"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk-bundle"

# Scala
export PATH="$HOME/sbt/bin:$PATH"

# Node
export PATH="$HOME/nodejs/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Haskell
source $HOME/.ghcup/env

# Pyenv
export PYENV_ROOT="$HOME/bin/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PYTHONDONTWRITEBYTECODE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Go (GVM)
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# If on a work machine
source ~/.secret
source $HOME/zsh/work.sh
