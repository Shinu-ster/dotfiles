#!/usr/bin/env bash
set -e

echo "Setting up dotfiles..."

DOTFILES_DIR="$HOME/dotfiles"

# -------------------------
# Install dependencies
# -------------------------
echo "Installing packages..."

if command -v pacman &>/dev/null; then
  sudo pacman -S --needed \
    neovim git kitty rofi starship stow curl unzip
fi

if command -v apt &>/dev/null; then
  sudo apt update
  sudo apt install -y \
    neovim git kitty rofi stow curl unzip

  # install starship if missing
  if ! command -v starship &>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  fi
fi

# -------------------------
# Ensure config directory exists
# -------------------------
mkdir -p ~/.config

# -------------------------
# Link configs with stow
# -------------------------
echo "Linking configs..."

cd "$DOTFILES_DIR"

stow bash
stow git
stow kitty
stow nvim
stow rofi
stow starship

# -------------------------
# Install Neovim plugins
# -------------------------
if command -v nvim &>/dev/null; then
  echo "Installing Neovim plugins..."
  nvim --headless "+Lazy! sync" +qa || true
fi

echo "Dotfiles setup complete."
