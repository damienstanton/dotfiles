#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
VIM_FILE="$HOME/.config/nvim/init.vim"
cp $ZSH_FILE zsh/
cp $VIM_FILE vim/
echo "Files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "👍  Done."
