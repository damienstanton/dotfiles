#!/usr/bin/env zsh


if [[ "$USER" == "root" ]]; then USERCOLOR="red"; else USERCOLOR="yellow"; fi

check_git_prompt_info() {
    if git rev-parse --git-dir > /dev/null 2>&1; then
        if [[ -z $(git_prompt_info) ]]; then
            echo "%{$fg[blue]%}detached-head%{$reset_color%}) $(git_prompt_status)
%{$fg[yellow]%}::"
        else
            echo "$(git_prompt_info) $(git_prompt_status)
%{$fg_bold[cyan]%}:: "
        fi
    else
        echo "%{$fg_bold[cyan]%}:: "
    fi
}

# get_right_prompt() {
#     if git rev-parse --git-dir > /dev/null 2>&1; then
#         echo -n "$(git_prompt_short_sha)%{$reset_color%}"
#     else
#         echo -n "%{$reset_color%}"
#     fi
# }

# Updates editor information when the keymap changes.
zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% N]%}/(main|viins)/[% I]%}"
}

# timestamp %{$fg_no_bold[green]%}[%T]\

# The main prompt
# ---------------
PROMPT='%{$fg_no_bold[magenta]%}[%2~]\
$(check_git_prompt_info)\
%{$reset_color%}'

# RPROMPT='$(get_right_prompt)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%} ✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$fg_bold[white]%}^"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$fg_bold[white]%}[%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$fg_bold[white]%}]"
