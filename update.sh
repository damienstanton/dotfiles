#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/ds.zsh-theme"
VIM_FILE="$HOME/.config/nvim/init.vim"
TMUX_FILE="$HOME/.tmux.conf"
cp $ZSH_FILE zsh/
echo "Added ZSH config."
cp $ZSH_THEME_FILE zsh/
echo "Added custom ZSH theme."
cp $VIM_FILE vim/
echo "Added neovim config."
cp $TMUX_FILE tmux/
echo "Added tmux config."
echo "All files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "👍  Done."
