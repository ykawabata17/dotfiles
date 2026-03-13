#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Dotfiles Setup ==="
echo "Dotfiles directory: $DOTFILES_DIR"

# --- Homebrew ---
if ! command -v brew &> /dev/null; then
  echo ">>> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo ">>> Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# --- Symlinks ---
echo ">>> Creating symlinks..."

create_symlink() {
  local src="$1"
  local dest="$2"
  if [ -L "$dest" ]; then
    echo "  Skipping (already linked): $dest"
  elif [ -e "$dest" ]; then
    echo "  Backing up existing: $dest → ${dest}.bak"
    mv "$dest" "${dest}.bak"
    ln -s "$src" "$dest"
    echo "  Linked: $src → $dest"
  else
    mkdir -p "$(dirname "$dest")"
    ln -s "$src" "$dest"
    echo "  Linked: $src → $dest"
  fi
}

# ホームディレクトリ直下の dotfiles
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES_DIR/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

# .config 配下
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"
create_symlink "$DOTFILES_DIR/.config/wezterm" "$HOME/.config/wezterm"
create_symlink "$DOTFILES_DIR/.config/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$DOTFILES_DIR/.config/sheldon" "$HOME/.config/sheldon"

# --- シークレット用ファイル ---
if [ ! -f "$HOME/.zshrc.local" ]; then
  echo ">>> Creating ~/.zshrc.local for secrets..."
  cat > "$HOME/.zshrc.local" << 'SECRETS'
# このファイルは git 管理されません
# API キーや秘密の環境変数をここに書いてください

# export GEMINI_API_KEY="your-key-here"
# export BUNDLE_ENTERPRISE__CONTRIBSYS__COM="your-token-here"
SECRETS
  echo "  Created: ~/.zshrc.local (add your secrets here)"
fi

echo ""
echo "=== Setup Complete! ==="
echo "Next steps:"
echo "  1. Edit ~/.zshrc.local to add your secret keys"
echo "  2. Restart your terminal"
