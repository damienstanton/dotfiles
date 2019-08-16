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
REGOLITH_BAR_DIR="$HOME/.config/i3xrocks/"

cp $ZSH_FILE zsh/
cp $ZSH_THEME_FILE zsh/
cp $ZSH_LANG_FILE zsh/
cp $ZSH_WORK_FILE zsh/
echo "Wrote custom ZSH theme, functions, and aliases."

cp $VIM_FILE vim/
cp $COC_FILE vim/
cp $COC_VIMFILE vim/
echo "Wrote vim configuration."

cp $REGOLITH_XFILE regolith/
cp -r $REGOLITH_XDIR regolith/
cp -r $REGOLITH_CONF_DIR regolith/
cp -r $REGOLITH_BAR_DIR regolith/
echo "Wrote i3-regolith configuration."

echo "All files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "Done."
