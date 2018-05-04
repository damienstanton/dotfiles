#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
VIM_FILE="$HOME/.config/nvim/init.vim"
TMUX_FILE="$HOME/.tmux.conf"
cp $ZSH_FILE zsh/
cp $VIM_FILE vim/
cp $TMUX_FILE tmux/
echo "Files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "👍  Done."
