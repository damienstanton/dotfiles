set -x EDITOR nvim
set -x GIT_EDITOR nvim 
set -x TERM xterm-256color
set -x theme_color_scheme solarized-dark
fish_vi_key_bindings

# Android
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

# GCloud
set -gx PATH $PATH $HOME/google-cloud-sdk/bin

# Postgres
set -x PGDATA $HOME/postgres

# Scripts
set -gx PATH $PATH $HOME/scripts
set -gx PATH $PATH $HOME/work/scripts

# Fix ipython not sticking to a virtualenv
alias ipy "python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Go
set -x GOPATH $HOME/go
set -gx PATH $PATH $HOME/go/bin

# C++
set -x BOOST_ROOT /usr/local/Cellar/boost/1.67.0_1
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"


# Bazel
set -gx PATH $PATH $HOME/bin

# Rust
set -gx PATH $PATH $HOME/.cargo/bin

# Haskell
set -gx PATH $PATH /Users/damien/.local/bin

# Node
set -x NODE_PATH /usr/local/lib/node_modules

# SDL2
set -x LIBRARY_PATH $LIBRARYPATH /usr/local/lib

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
alias updateall "brew update; and brew upgrade; and brew cleanup; and npm update -g; and rustup update"
alias rff "rm -rf"
alias cqlsh "cqlsh --cqlversion 3.4.0"
alias k "kubectl"
alias listening "lsof -P | grep LISTEN"
alias pyinit "python3 -m venv env; and source env/bin/activate.fish; and pip3 install --upgrade pip yapf ipython pylint requests; and pip3 install -r requirements.txt"
alias activate "source env/bin/activate"
alias fishconf "nvim $HOME/.config/fish/config.fish"
alias reload "source $HOME/.config/fish/config.fish"
alias gd "git diff --color=always"
alias notebook "jupyter notebook --no-browser"

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
	cd $HOME/go/src/code.wirelessregistry.com/signal-graph/analytics
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

function sourcegraph
    docker run --publish 7080:7080 --rm --volume ~/.sourcegraph/config:/etc/sourcegraph --volume ~/.sourcegraph/data:/var/opt/sourcegraph --volume /var/run/docker.sock:/var/run/docker.sock sourcegraph/server:2.11.2
end

# fuckin' .pyc files, man
set -x PYTHONDONTWRITEBYTECODE 1

# ---------------
# TWR dev configs
# --------------
set -gx PATH $PATH $WRPATH/backend/scripts
set -x WRPATH $GOPATH/src/code.wirelessregistry.com/signal-graph
function devstart
    wrdev; and cd ../..
    bash scripts/devctl.sh start
end

function devstop
    wrdev; and cd ../..
    bash scripts/devctl.sh stop
end

function devreboot
    wrdev; and cd ../..
    bash scripts/devctl.sh stop
    make clean
    make install
    bash scripts/devctl.sh start
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# setup_python
function setup_python
    pip3 install --upgrade requests flask numpy matplotlib
end

# setup tensorflow
function setup_tensorflow
    pip3 install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.10.0-py3-none-any.whl
end

# setup python notebooks
function setup_notebooks
    pip3 install --upgrade jupyter jupyterthemes ipyparallel
    jt -t solarizedd -f firacode
    ipcluster nbextension enable
end

function disable_pycluster
    ipcluster nbextension disable
end
