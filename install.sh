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

# Install cowsay into ~/.local (no root needed)
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
git clone https://github.com/cowsay-org/cowsay.git
cd cowsay
make install prefix=$HOME/.local

# Add the train cow used by boilersay (site-cows is on cowsay's default path)
mkdir -p "$HOME/.local/share/cowsay/site-cows"
cp "$DOTFILES_DIR/train.cow" "$HOME/.local/share/cowsay/site-cows/"
