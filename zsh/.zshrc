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

plugins=(git dirhistory docker git-extras gradle node npm osx pip sudo wd)

source $ZSH/oh-my-zsh.sh

# Scripts
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/work/scripts:$PATH"

# Custom binaries
export PATH="$HOME/bin:$PATH"

# Go
export PATH="/usr/local/go/bin:$PATH"

# Node
export PATH="/usr/local/nodejs/bin:$PATH"

# CMake runner
function cmb() {
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    cmake -G "Unix Makefiles" ..
    make
    cd ..
}


# aliases
alias g="git"
alias vimconf="$EDITOR $HOME/.vimrc"
alias cat="bat"
alias e="$EDITOR"
alias ls="exa"
alias p="echo|clear;pwd"
alias gs="git status"
alias push="git push"
alias pull="git pull --rebase"
alias c="clear;ls -l -snew -B"
alias ll="clear;ls -l -B"
alias ct="clear;ls -T --level=2"
alias untar="tar -xvf"
alias guntar="tar -xzf"
alias bn="clear;babel-node"
alias sub="git submodule update --init --recursive"
alias updateall="brew update && brew upgrade && brew cleanup && npm update -g && rustup update"
alias rff="rm -rf"
alias cqlsh="cqlsh --cqlversion 3.4.0"
alias k="kubectl"
alias listening="lsof -P | grep LISTEN"
alias pyinit="python3 -m venv env && source env/bin/activate.fish && pip3 install --upgrade pip yapf ipython pylint requests && pip3 install -r requirements.txt"
alias activate="source env/bin/activate"
alias zshconf="$EDITOR $HOME/.zshrc"
alias emacsconf="$EDITOR ~/.spacemacs"
alias reload="source $HOME/.zshrc"
alias gd="git diff --color=always"
alias notebook="jupyter notebook --no-browser"
alias py="ipython3"

# grab just the dir name
export NAME="${PWD##*/}"

function sizeof() {
  du -h $1 | tail -n 1
}

function dockerdelete() {
	docker rmi --force `docker images -a -q`
}

function syncfork() {
    git fetch up
    git checkout master
    git merge up/master
    git push
    git checkout -
}

# fuckin' .pyc files, man
export PYTHONDONTWRITEBYTECODE=1

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
