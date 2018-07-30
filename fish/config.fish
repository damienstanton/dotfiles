set -x EDITOR nvim
set -x GIT_EDITOR nvim 
set -x TERM xterm-256color
set -x theme_color_scheme solarized-dark
fish_vi_key_bindings

# Android
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x JAVA_HOME (/usr/libexec/java_home)

# GCloud
set -gx PATH $PATH $HOME/google-cloud-sdk/bin

# Postgres
set -x PGDATA $HOME/postgres

# Scripts
set -gx PATH $PATH $HOME/scripts
set -gx PATH $PATH $HOME/work/scripts

# Fix ipython not sticking to a virtualenv
alias ipy "python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Backups
set -x BACKUPDIR /Volumes/Storage/backups

# Go
set -x GOPATH $HOME/go
set -gx PATH $PATH $HOME/go/bin

# C++ (gcc)
# Commented out because Xcode/clang will explode and do horrible things otherwise.
# set -x NCC /usr/local/Cellar/gcc/7.2.0/bin/c++-7
# set -x NCXX /usr/local/Cellar/gcc/7.2.0/bin/g++-7

# Bazel
set -gx PATH $PATH $HOME/bin

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# Haskell
set -gx PATH $PATH /Users/damien/.local/bin

# Node
set -x NODE_PATH /usr/local/lib/node_modules

# aliases
alias g "git"
alias vi "nvim"
alias vim "nvim"
alias vimconf "nvim $HOME/.config/nvim/init.vim"
alias e "nvim"
alias ls "exa"
alias p "echo|clear;pwd"
alias gs "git status"
alias push "git push"
alias pull "git pull --rebase"
alias c "clear;ls -l -snew -B"
alias ll "clear;ls -l -B"
alias ct "clear;ls -T --level=2"
alias untar "tar -xvf"
alias guntar "tar -xzf"
alias bn "clear;babel-node"
alias serve "python3 -m http.server"
alias sub "git submodule update --init --recursive"
alias updateall "brew update; and brew upgrade; and brew cleanup; and npm update -g"
alias rff "rm -rf"
alias cqlsh "cqlsh --cqlversion 3.4.0"
alias k "kubectl"
alias listening "lsof -P | grep LISTEN"
alias octave "/usr/local/octave/3.8.0/bin/octave-3.8.0"
alias pyinit "python3 -m venv env; and source env/bin/activate; and pip3 install yapf ipython jupyterlab; and pip3 install -r requirements.txt"
alias activate "source env/bin/activate"
alias fishconf "nvim $HOME/.config/fish/config.fish"
alias reload "source $HOME/.config/fish/config.fish"

function flip
    if [ $theme_color_scheme = "solarized-light" ]
        set -x theme_color_scheme solarized-dark
    else if [ $theme_color_scheme = "solarized-dark" ]
        set -x theme_color_scheme solarized-light
    end
end

# merging safely
function synchronize
    git checkout master
    git pull --rebase
    git checkout -
    git merge --no-ff master
    git push
end

# set GOPATH and jump to personal work
function godev
	set -x GOPATH $HOME/go
	echo "GOPATH is now $GOPATH"
	cd $GOPATH/src/github.com/damienstanton
end

# set GOPATH and jump to work work
function wrdev
	set -x GOPATH $HOME/go/src/code.wirelessregistry.com/signal-graph/backend
	echo "GOPATH is now $GOPATH"
	cd $GOPATH/src/code.wirelessregistry.com
end

function sizeof
  du -h $1 | tail -n 1
end

function testall
 go test ./... -cover
end

function dockerdelete
	docker rmi `docker images -a -q`
end

# fuckin' .pyc files, man
set -x PYTHONDONTWRITEBYTECODE 1

# ---------------
# TWR dev configs
# --------------
set -gx PATH $PATH $WRPATH/backend/scripts
set -x WRPATH $GOPATH/src/code.wirelessregistry.com/signal-graph
