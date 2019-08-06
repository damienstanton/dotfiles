#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
VIM_FILE="$HOME/.vimrc"
COC_FILE="$HOME/.vim/coc-settings.json"
COC_VIMFILE="$HOME/.vim/custom.vim"

echo "Installing ZSH config."
cat zsh/.zshrc > $ZSH_FILE
echo "Done."
echo "Installing custom ZSH theme."
cp zsh/ds.zsh-theme "$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
echo "Done."

echo "Installing vim config..."
cat vim/.vimrc > $VIM_FILE
cp vim/coc-settings.json "$HOME/.vim/"
cp vim/custom.vim "$HOME/.vim/"
echo "Done."

echo "All files are updated."
