#!/bin/bash
set -e
ZSH_FILE="$HOME/.zshrc"
EMACS_FILE="$HOME/.emacs"
cp $ZSH_FILE zsh/
cp $EMACS_FILE emacs/
echo "Files are updated."
echo "Uploading to GitHub..."
git add -A && git commit -m "Dotfiles synced on $(date +%Y-%m-%d)" && git push
echo "👍  Done."
