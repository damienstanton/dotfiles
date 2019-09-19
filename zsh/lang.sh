# configuration aliases
alias vimconf="$EDITOR $HOME/.vimrc"
alias zshconf="$EDITOR $HOME/.zshrc"
alias lsconf="$EDITOR $HOME/.vim/coc-settings.json"

# other aliases
alias g="git"
alias cat="bat"
alias e="$EDITOR"
alias gs="git status"
alias push="git push"
alias pull="git pull --rebase"
alias c="clear;exa -l -B"
alias ct="clear;exa -T --level=2"
alias untar="tar -xvf"
alias sub="git submodule update --init --recursive"
alias updateall="sudo apt update && sudo apt upgrade -y && sudo apt autoremove && npm update -g && rustup update"
alias rff="rm -rf"
alias k="kubectl"
alias listening="lsof -P | grep LISTEN"
alias reload="source $HOME/.zshrc"
alias gdiff="git difftool --no-prompt --tool vimdiff"
alias pip="python3 -m pip"
alias psp="psc-package"
alias please="sudo"
alias sorry='sudo $(fc -ln -1)'
alias open="xdg-open"

# override GOPATH
gopath() {
    cmd=$1
    target=$2
    case $cmd in
        "reset")
            export GOPATH=$(<$HOME/.tmp/saved_gopath)
            echo "GOPATH has been reset to $GOPATH"
            echo $GOPATH > $HOME/.tmp/saved_gopath
            ;;
        "override")
            echo $GOPATH > $HOME/.tmp/saved_gopath
            if [ -z $target ]; then
                export GOPATH=$(pwd)
                echo "New GOPATH=$GOPATH"
            else
                case $target in
                    ".")
                        export GOPATH=$(pwd)
                        echo "New GOPATH=$GOPATH"
                        ;;
                    *)
                        export GOPATH=$target
                        echo "New GOPATH=$GOPATH"
                        ;;
                esac
            fi
            ;;
        *)
            echo "not a valid 'gopath' command. Valid ones: ['override', 'reset']"
            ;;
    esac
}

# runner for CMake
cmakebuild() {
    if [ ! -d "build" ]; then
        mkdir build
    fi
    cd build
    cmake -G "Unix Makefiles" ..
    make
    cd ..
}

# human readable size check
sizeof() {
  du -h $1 | tail -n 1
}

# delete all docker images, recursively
dockerdelete() {
	docker rmi --force `docker images -a -q`
}

# synchronize a working branch with another branch via rebase
synchronize() {
	branch=$1
	if [ -z $1 ]; then
    branch=master
  fi
	git checkout $branch 
	git pull --rebase
	git checkout -
	git merge --no-ff $branch
	git push
}

# build a new C++ project using gnu make
init_cpp() {
project=$1
cpp_ver=$2

if [[ -z $2 ]]; then
    cpp_ver="c++17"
fi

mkdir $project && cd $project
cat <<MAKEFILE > Makefile
name := \$(shell basename \$(CURDIR))

default: build

build:
	@echo "Compiling..."
	@g++ -pipe -O2 -std=$cpp_ver *.cpp -lm -o \$(name)
	@echo "Done. Calling executable: \$(name)"
	./\$(name)

clean:
	@echo "Deleting \$(name)"
	@rm \$(name)
MAKEFILE
cd ..
echo "Created project $project"
}

# retrieve one of my git repos (since my username is known, this is an easy shorthand)
getme() {
    git clone https://github.com/damienstanton/$1 $2 # where 2 is an alias
}

# simpler one-shot commit shortcut
commit() {
    echo "Please type your commit message:"
    echo
    read INPUT
    git add -A \
        && git commit -m "$INPUT" \
        && git push
}

# firstpush is the same as commit, but sets the origin
firstpush() {
    echo "Please type your initial commit message:"
    echo
    read INPUT
    git add -A \
        && git commit -m "$INPUT" \
        && git push --set-upstream origin master
}

# generate a reasonable gitignore
ignore() {
cat <<I>> .gitignore
*.DS_Store
env/
bin/*
!src/bin/
node_modules/
.vscode/
.idea/
vendor/
target/
build/
.gradle/
**/*.rs.bk
.metals/
.bloop/
dist/
dist-newstyle/
I
}

# automatically write a MIT license, including the current year and copyright holder
copyright() {
cat <<LIC>> LICENSE
Copyright (c) $(date +%Y) $@

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

LIC

cat <<CPR>> README.md

© $(date +%Y) $@

See LICENSE for details.

CPR
}

# peek at a particular line in a file (decent for printf-style debugging)
show() {
    line_number=$1
    start=$(($line_number - 10))
    stop=$(($line_number + 10))

    case "$2" in
        "in")
            file_path=$3
            ;;
        *)
            echo "Usage: show <line_number> in <path_to_file>"
            ;;
    esac

    awk "NR >= $start && NR <= $stop + 10" $file_path
}

# create a new github repo from the command line
createremote() {
    w=$1
    u="damienstanton"
    if [ -z "$1" ]; then
        echo -n "Need the name of the new repo:"
        read w
    fi
    curl -u $u https://api.github.com/user/repos -d "{\"name\":\"$w\"}"
    git init && git remote add origin https://github.com/$u/$w
}

# set the current dir to an existing github remote.
remote() {
    git init && git remote add origin https://github.com/$1
}

# pretty JSON object catting
jv() {
    jq -C . $1 | less -R
}

# pretty CSV object catting
cv() {
    cat $1 | sed 's/,/ ,/g' | column -t -s, | less -S
}

# automate synchro with a third-party github repo (useful for OSS stuff)
syncwith() {
    git remote add up https://github.com/$1
    git fetch up master \
        && git merge up/master \
        && git push \
        && echo "👌"
}

