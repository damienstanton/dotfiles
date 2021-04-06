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

# Prerelease nvim
export PATH="$HOME/nvim-osx64/bin:$PATH"

# Scripts
export PATH="$HOME/work/scripts:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Cargo-installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Pip-installed binaries
export PATH="$HOME/.local/bin:$PATH"

# Python system libs
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Updated LLVM
export LDFLAGS="-L/usr/local/opt/llvm@8/lib"
export CPPFLAGS="-I/usr/local/opt/llvm@8/include"

# Node binaries
export PATH="/usr/local/Cellar/node/15.2.1/bin:$PATH"

# Flutter
export PATH="$HOME/flutter/bin:$PATH"

# Java
export JAVA_HOME=$HOME/jdk-15.0.2.jdk/Contents/Home

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk-bundle"

# Scala
export PATH="$HOME/sbt/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/bin/.pyenv"
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
