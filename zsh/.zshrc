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

plugins=(git dirhistory docker git-extras gradle node npm osx pip sudo wd)

source $ZSH/oh-my-zsh.sh

# ensure misc Brew-installed executables are found
export PATH="/usr/local/sbin:$PATH"

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
export PATH="$GOPATH/src/github.com/damienstanton/signal-graph/backend/bin:$PATH"

# C++ (gcc)
# Commented out because Xcode/clang will explode and do horrible things otherwise.
# export NCC="/usr/local/Cellar/gcc/7.2.0/bin/c++-7"
# export NCXX="/usr/local/Cellar/gcc/7.2.0/bin/g++-7"

# Bazel
export PATH="$HOME/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Haskell
export PATH="/Users/damien/.local/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules"

# aliases
alias vi="nvim"
alias vim="nvim"
alias vimconf="nvim $HOME/.config/nvim/init.vim"
alias e="nvim"
alias p="echo|clear;pwd"
alias gs="git status"
alias c="clear;ls -Ctrl"
alias ll="clear;ls -C"
alias ct="clear;tree -L 2"
alias untar="tar -xvf"
alias guntar="tar -xzf"
alias bn="clear;babel-node"
alias serve="python3 -m http.server"
alias sub="git submodule update --init --recursive"
alias updateall="brew update && brew upgrade && brew cleanup && npm update -g"
alias rff="rm -rf"
alias cqlsh="cqlsh --cqlversion=3.4.0"
alias k="kubectl"
alias listening="lsof -P | grep LISTEN"
alias octave="/usr/local/octave/3.8.0/bin/octave-3.8.0"

# just the dir name
export NAME="${PWD##*/}"

godev() {
    export GOPATH="$HOME/go"
	echo "GOPATH is now $GOPATH"
    cd $GOPATH/src/github.com/damienstanton
}

wrdev() {
	export GOPATH="$GOPATH/src/code.wirelessregistry.com/signal-graph/backend"
	echo "GOPATH is now $GOPATH"
	cd $GOPATH
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

export WRPATH=$GOPATH/src/github.com/damienstanton/signal-graph
export PATH="$WRPATH/backend/scripts:$PATH"
source $HOME/.secret

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
