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
export PATH="/usr/local/bin:$PATH"

# Android
export ANDROID_HOME="$HOME/Library/Android/sdk"

# JVM
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# Uncomment this to use the GraalVM (also v8)
#export JAVA_HOME=$HOME/graal/Contents/Home

# GCloud
export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# Postgres
export PGDATA="$HOME/postgres"

# Scripts
export PATH="$HOME/scripts:$PATH"
export PATH="$HOME/work/scripts:$PATH"

# Fix ipython not sticking to a virtualenv
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Go
export GOPATH="$HOME/go"
export PATH="$HOME/go/bin:$PATH"

# C++ (gcc)
export BOOST_ROOT="/usr/local/Cellar/boost/1.67.0_1"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

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

# Bazel
export PATH="$HOME/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Haskell
export PATH="/Users/damien/.local/bin:$PATH"

# Node
export NODE_PATH="/usr/local/lib/node_modules"

# aliases
alias g="git"
alias vi="nvim"
alias vim="nvim"
alias vimconf="nvim $HOME/.config/nvim/init.vim"
alias cat="bat"
alias e="nvim"
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
alias serve="python3 -m http.server"
alias sub="git submodule update --init --recursive"
alias updateall="brew update && brew upgrade && brew cleanup && npm update -g && rustup update"
alias rff="rm -rf"
alias cqlsh="cqlsh --cqlversion 3.4.0"
alias k="kubectl"
alias listening="lsof -P | grep LISTEN"
alias pyinit="python3 -m venv env && source env/bin/activate.fish && pip3 install --upgrade pip yapf ipython pylint requests && pip3 install -r requirements.txt"
alias activate="source env/bin/activate"
alias zshconf="nvim $HOME/.zshrc"
alias reload="source $HOME/.zshrc"
alias gd="git diff --color=always"
alias notebook="jupyter notebook --no-browser"
alias py="ipython3"
alias kshell="$SPARKLIN_HOME/bin/sparklin-spark2x.sh"

# grab just the dir name
export NAME="${PWD##*/}"

function sizeof() {
  du -h $1 | tail -n 1
}

function dockerdelete() {
	docker rmi `docker images -a -q`
}

# fuckin' .pyc files, man
export PYTHONDONTWRITEBYTECODE=1

# ---------------
# WORK DEV THINGS
# ---------------

export WRPATH=$GOPATH/src/code.wirelessregistry.com/signal-graph
export USER_BUCKET="s3://wirelessregistry-emr-jobs/damien/"
export PATH="$WRPATH/backend/scripts:$PATH"
export PATH="$WRPATH/datasci/scripts:$PATH"


# Spark/Scala
export SPARK_HOME="$HOME/spark_home_2.3.2"
export PATH="$SPARK_HOME/bin:$PATH"
export PYSPARK_PYTHON="$WRPATH/datasci/scripts/datasci_env/bin/python"
export SPARKLIN_HOME="$HOME/oss/sparklin"
export PATH="$SPARKLIN_HOME/bin:$PATH"


source $HOME/.secret

function wrdev() {
	export GOPATH="$WRPATH/backend"
	echo "GOPATH is now $GOPATH"
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
    bash scripts/devctl.sh start
}

function devstop() {
    wrdev && cd ../backend
    bash scripts/devctl.sh stop
}

function devreboot() {
    wrdev && cd ../backend
    bash scripts/devctl.sh stop
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


function datasci_db() {
    psql --host=$DB_HOST_URL --username=$DB_USER --dbname=$DB_NAME
}

function upload_spark() {
    aws s3 cp ~/go/src/code.wirelessregistry.com/signal-graph/analytics/scala-spark-main/target/scala-2.11/main-assembly-1.0.jar s3://wirelessregistry-emr-jobs/damien/
}

export WR_AWS_CLUSTER_ANNE="j-1QJ95KFBRUDU3"
export USER_CLUSTER_ID="j-IHX5U8CJ0E02"
export WR_AWS_CLUSTER_KRIS="j-XU4GLVQ3U1H7"

# shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
