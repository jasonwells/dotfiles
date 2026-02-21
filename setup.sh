#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

symlink() {
  local src="$1"
  local dest="$2"

  if [ -L "$dest" ]; then
    echo "Replacing existing symlink: $dest"
    rm "$dest"
  elif [ -e "$dest" ]; then
    echo "Backing up $dest to ${dest}.bak"
    mv "$dest" "${dest}.bak"
  fi

  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
}

symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
symlink "$DOTFILES_DIR/aliases" "$HOME/.aliases"
symlink "$DOTFILES_DIR/functions" "$HOME/.functions"
symlink "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
symlink "$DOTFILES_DIR/vim" "$HOME/.vim"
