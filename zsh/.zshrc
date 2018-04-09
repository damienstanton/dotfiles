##########
# +----+ #
# | DS | #
# +----+ #
##########

export EDITOR="emacs"
export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="damien"
ZSH_THEME="ds"
COMPLETION_WAITING_DOTS="true"

plugins=(git dirhistory docker git-extras gradle node npm osx pip sudo wd)

source $ZSH/oh-my-zsh.sh

# ensure misc Brew-installed executables are found
export PATH="/usr/local/sbin:$PATH"

# AMD Core Math
export ACML_FMA=0
export LD_LIBRARY_PATH=/opt/acml5.3.1/ifort64/lib:$LD_LIBRARY_PATH

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# GCloud
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# Postgres
export PGDATA="$HOME/postgres"

# Scripts
export PATH="$HOME/scripts:$PATH"

# Fix ipython not sticking to a virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Backups
export BACKUPDIR="/Volumes/Storage/backups"

# Go
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"
export PATH="/usr/local/opt/go/libexec/bin:$PATH"
export PATH="/Users/damien/go/src/code.wirelessregistry.com/signal-graph/backend/bin:$PATH"

# C++ (gcc)
# export NCC="/usr/local/Cellar/gcc/7.2.0/bin/c++-7"
# export NCXX="/usr/local/Cellar/gcc/7.2.0/bin/g++-7"

# Conda
export PATH="$HOME/miniconda3/bin:$PATH"

# Bazel
export PATH="$HOME/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Haskell
export PATH="/Users/damien/.local/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules"

# aliases
alias sp="source env/bin/activate"
alias vi="vim"
alias e=emacs
alias p="echo|clear;pwd"
alias gs="git status"
alias c="clear;ls -Ctrl"
alias ll="clear;ls -C"
alias x="clear;ls -C"
alias ct="clear;tree -L 2"
alias tree="tree -I "env""
alias untar="tar -xvf"
alias guntar="tar -xzf"
alias bn="clear;babel-node"
alias serve="python3 -m http.server"
alias sub="git submodule update --init --recursive"
alias get="go get -u -v"
alias updateall="brew update && brew upgrade && brew cleanup && npm update -g"
alias rff="rm -rf"
alias cqlsh="cqlsh --cqlversion=3.4.0"
alias k="kubectl"
alias vis="vim -o"
alias listening="lsof -P | grep LISTEN"
alias watchgit="watch --color -n 5 git lg"
alias octave="/usr/local/octave/3.8.0/bin/octave-3.8.0"
alias clojars-deploy="GPG_TTY=$(tty) lein deploy clojars"

export NAME="${PWD##*/}"

godev() {
    wroff && cd $GOPATH/src/github.com/damienstanton
}

sizeof() {
  du -h $1 | tail -n 1
}

testall() {
 go test ./... -cover
}

removeDockerImages() {
	docker rmi `docker images -a -q`
}

# fuckin' .pyc files, man
export PYTHONDONTWRITEBYTECODE=1

# ---------------
# TWR dev configs
# --------------
PLATFORM=`uname -s | tr '[:upper:]' '[:lower:]'`
ARCH="amd64"
export PATH="$HOME/kubernetes/platforms/$PLATFORM/$ARCH:$PATH"
export PATH="$HOME/kubernetes/client/bin:$PATH"
export KUBECONFIG="$GOPATH/src/code.wirelessregistry.com/signal-graph/data_model/kube.config"

wron() {
  export GOPATH=$HOME/go/src/code.wirelessregistry.com/signal-graph/backend
  echo "GOPATH is now $GOPATH"
}

wroff() {
  export GOPATH=$HOME/go
  echo "GOPATH is now $GOPATH"
}

wrdev() {
  wron && cd $GOPATH/src/code.wirelessregistry.com
}

# WR dev environment scripts
export WRPATH=$HOME/go/src/code.wirelessregistry.com/signal-graph
export PATH="$WRPATH/backend/scripts:$PATH"

# Load secured env vars
source $HOME/.secret

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

