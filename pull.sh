#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
ZSH_LANG_FILE="$HOME/zsh/lang.sh"
ZSH_WORK_FILE="$HOME/zsh/work.sh"
VIM_FILE="$HOME/.vimrc"
COC_FILE="$HOME/.vim/coc-settings.json"
COC_VIMFILE="$HOME/.vim/custom.vim"

echo "Installing ZSH config."
cat zsh/.zshrc > $ZSH_FILE
echo "Done."
echo "Installing custom ZSH theme."
cp zsh/ds.zsh-theme "$HOME/.oh-my-zsh/custom/themes/"
echo "Done."
echo "Installing custom zsh functions/aliases"
cp zsh/lang.sh $HOME/zsh/
echo "Done."
echo "Installing custom zsh functions/aliases for work"
cp zsh/work.sh $HOME/zsh/
echo "Done."

echo "Installing vim config..."
cat vim/.vimrc > $VIM_FILE
cp vim/coc-settings.json "$HOME/.vim/"
cp vim/custom.vim "$HOME/.vim/"
echo "Done."

echo "All files are updated."