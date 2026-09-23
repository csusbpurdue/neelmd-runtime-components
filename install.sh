#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

for f in .bashrc .zshrc .vimrc .gdbinit; do
  if [ -f "$DIR/$f" ]; then
    cp "$DIR/$f" "$HOME/$f"
    echo "installed $f"
  fi
done

if [ -f "$DIR/.gitconfig" ]; then
  cp "$DIR/.gitconfig" "$HOME/.gitconfig.rc"
  if ! git config --global --get-all include.path 2>/dev/null | grep -q "$HOME/.gitconfig.rc"; then
    git config --global --add include.path "$HOME/.gitconfig.rc"
  fi
  echo "installed .gitconfig"
fi

echo "done"
