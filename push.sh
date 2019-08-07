#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
ZSH_LANG_FILE="$HOME/zsh/lang.sh"
ZSH_WORK_FILE="$HOME/zsh/work.sh"
VIM_FILE="$HOME/.vimrc"
COC_FILE="$HOME/.vim/coc-settings.json"
COC_VIMFILE="$HOME/.vim/custom.vim"

cp $ZSH_FILE zsh/
echo "Added ZSH config."
cp $ZSH_THEME_FILE zsh/
echo "Added custom ZSH theme."
cp $ZSH_LANG_FILE zsh/
echo "Added custom ZSH functions/aliases."
cp $ZSH_WORK_FILE zsh/
echo "Added custom ZSH functions/aliases for work."

cp $VIM_FILE vim/
cp $COC_FILE vim/
cp $COC_VIMFILE vim/
echo "Added vim config."


echo "All files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "Done."
