##########
# +----+ #
# | DS | #
# +----+ #
##########

export EDITOR="nvim"
export GIT_EDITOR="nvim"
export TERM="xterm-256color"
export ZSH=$HOME/.oh-my-zsh
# set base colors for bat and alacritty, and simple apply switches
export BAT_THEME="OneHalfLight"
LIGHT_COLOR="base16-tomorrow.yml"
DARK_COLOR="base16-tomorrow-night.yml"
alias day="alacritty-colorscheme -c $HOME/.alacritty.yml -V apply $LIGHT_COLOR"
alias night="alacritty-colorscheme -c $HOME/.alacritty.yml -V apply $DARK_COLOR"
alias toggle="alacritty-colorscheme -c $HOME/.alacritty.yml -V toggle $LIGHT_COLOR $DARK_COLOR"

DEFAULT_USER="damien"
ZSH_THEME="ds"
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1
plugins=(git dirhistory docker git-extras gradle node npm macos pip sudo wd vi-mode)

# imports
source $HOME/zsh/lang.sh
source $ZSH/oh-my-zsh.sh
source $HOME/zsh/work.sh

# scripts
export PATH="$HOME/work/scripts:$PATH"

# custom binaries
export PATH="$HOME/bin:$PATH"

# cargo-installed binaries
export PATH="$HOME/.cargo/bin:$PATH"

# pip-installed binaries
export PATH="$HOME/.local/bin:$PATH"

# python system libs
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# flutter
export PATH="$HOME/flutter/bin:$PATH"

# java
export JAVA_HOME="/usr/local/Cellar/openjdk@11/11.0.12"
export PATH="/usr/local/Cellar/openjdk@11/11.0.12/bin:$PATH"

# brew node
export PATH="/usr/local/Cellar/node@16/16.13.0/bin:$PATH"

# android
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/23.0.7123448" # keep track of these versions
export androidc="$NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin"

# pyenv
export PYENV_ROOT="$HOME/bin/.pyenv"
export PYTHONDONTWRITEBYTECODE=1

# clojure CLR (clojure JVM installed via brew, clojurescript via npm)
export PATH="$HOME/.dotnet/tools:$PATH"


# fzf and fd configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
source $HOME/fzf-theme/fzf-papercolor.sh

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
[ -f "/Users/dstanton006/.ghcup/env" ] && source "/Users/dstanton006/.ghcup/env" # ghcup-env

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/dstanton006/.sdkman"
[[ -s "/Users/dstanton006/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/dstanton006/.sdkman/bin/sdkman-init.sh"

# opam configuration
test -r /Users/damien/.opam/opam-init/init.zsh && . /Users/damien/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PATH="$HOME/.opam/default/bin:$PATH"

# haskell path
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.ghcup/ghc/8.10.5/bin:$PATH"

# starship promot
eval "$(starship init zsh)"
