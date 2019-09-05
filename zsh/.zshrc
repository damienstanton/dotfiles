##########
# +----+ #
# | DS | #
# +----+ #
##########

export EDITOR="vim"
export GIT_EDITOR="vim"
export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh
DEFAULT_USER="damien"
ZSH_THEME="ds"
COMPLETION_WAITING_DOTS="true"
plugins=(git dirhistory docker git-extras gradle node npm osx pip sudo wd vi-mode)

source $HOME/zsh/lang.sh
source $HOME/zsh/work.sh
source $ZSH/oh-my-zsh.sh

# Scripts
export PATH="$HOME/work/scripts:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Cargo-installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Pip-installed binaries
export PATH="$HOME/.local/bin:$PATH"
export PYTHONDONTWRITEBYTECODE=1

# Go
export PATH="$HOME/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Java
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"

# Android
export ANDROID_SDK_ROOT="$HOME/Android/Sdk/"
export PATH="$HOME/android-studio/bin:$PATH"
alias studio="studio.sh"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/damienstanton/.sdkman"
[[ -s "/home/damienstanton/.sdkman/bin/sdkman-init.sh" ]] && source "/home/damienstanton/.sdkman/bin/sdkman-init.sh"

# opam configuration
test -r /home/damien/.opam/opam-init/init.zsh && . /home/damien/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
