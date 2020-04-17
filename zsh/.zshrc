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

# Updated LLVM
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

# GraalVM Java
# export JAVA_HOME="$HOME/graal/Contents/Home"
# export PATH="$HOME/graal/Contents/Home/bin:$PATH"

# System Java
export JAVA_HOME="$(/usr/libexec/java_home)"
export PATH="$JAVA_HOME/bin:$PATH"
export JAVA_OPTS="-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk-bundle"

# Scala
export PATH="$HOME/sbt/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/bin/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export PYTHONDONTWRITEBYTECODE=1

# fzf and fd configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"


# Silly stuff
export PATH="$HOME/doomfiles/bin:$PATH"

# Go
export GO111MODULE=on
export PATH="$HOME/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# If on a work machine
source ~/zsh/work.sh
source ~/.secret
