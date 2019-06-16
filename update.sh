#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
VIM_FILE="$HOME/.vimrc"
COC_FILE="$HOME/.vim/coc-settings.json"

cp $ZSH_FILE zsh/
echo "Added ZSH config."
cp $ZSH_THEME_FILE zsh/
echo "Added custom ZSH theme."
cp $VIM_FILE vim/
cp $COC_FILE vim/
echo "Added vim config."


echo "All files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "Done."
