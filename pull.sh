#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
ZSH_THEME_FILE="$HOME/.oh-my-zsh/custom/themes/ds.zsh-theme"
ZSH_LANG_FILE="$HOME/zsh/lang.sh"
ZSH_WORK_FILE="$HOME/zsh/work.sh"
VIM_FILE="$HOME/.vimrc"
COC_FILE="$HOME/.vim/coc-settings.json"
COC_VIMFILE="$HOME/.vim/custom.vim"
REGOLITH_XFILE="$HOME/.Xresources-regolith-1.2.15"
REGOLITH_XDIR="$HOME/.Xresources.d/"
REGOLITH_CONF_DIR="$HOME/.config/i3-regolith/"

echo "Installing ZSH config."
cat zsh/.zshrc > $ZSH_FILE
echo "Done."
echo "Installing custom ZSH theme."
cp zsh/ds.zsh-theme "$HOME/.oh-my-zsh/custom/themes/"
echo "Done."
echo "Installing custom zsh functions/aliases"
if [ ! -d "$HOME/zsh" ]; then
    mkdir $HOME/zsh
fi
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

echo "Installing i3-regolith config..."
cp regolith/.Xresources-regolith-1.2.15 $HOME
cp -r regolith/.Xresources.d/ $HOME
cp -r regolith/i3-regolith $HOME/.config/

echo "Done."

echo "All files are updated."
