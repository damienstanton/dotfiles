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

# Cargo-installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# Pip-installed binaries
export PATH="$HOME/.local/bin:$PATH"

# Go
export PATH="/usr/local/go/bin:$PATH"
export PATH="/$GOPATH/bin:$PATH"

# Java & Scala
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="/usr/local/sbt/bin:$PATH"

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
alias gdiff="git difftool --no-prompt --tool vimdiff"
alias notebook="jupyter notebook --no-browser"
alias py="ipython3"
alias pip="python3 -m pip"

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

# ---------------
# WORK DEV THINGS
# ---------------

export WRPATH=$HOME/work/signal-graph
export PATH="$WRPATH/backend/scripts:$PATH"
export PATH="$WRPATH/datasci/scripts:$PATH"
# Set GOPATH to default work gopath
export GOPATH="$WRPATH/backend"


# Spark/Scala
export SPARK_HOME="$HOME/spark-2.4"
export PATH="$SPARK_HOME/bin:$PATH"
export PATH="$ZEPPELIN_HOME/bin:$PATH"
export PYSPARK_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/python"

function wrdev() {
	echo "GOPATH is $GOPATH"
	cd $WRPATH/datasci
	source $WRPATH/datasci/scripts/datasci_env/bin/activate
}

function synchronize() {
	git checkout master
	git pull --rebase
	git checkout -
	git merge --no-ff master
	git push
}

function devstart() {
    wrdev && cd ../backend
    scripts/devctl.sh start
}

function devstop() {
    wrdev && cd ../backend
    scripts/devctl.sh stop
}

function devreboot() {
    wrdev && cd ../backend
    scripts/devctl.sh stop
    make clean
    make install
    bash scripts/devctl.sh start
}

function clean_test() {
    wrdev && cd ../backend
    go clean -cache
	make clean
	make install
	make test
}

function query_prod() {
    # query_prod some_file.json
    curl -X POST $WR_PROD_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > prod_output.json
}

function query_test() {
    # query_test some_file.json
    curl -X POST $WR_TEST_URL -d @$1 --header "Content-Type: application/json; charset=utf-8" > test_output.json
}
