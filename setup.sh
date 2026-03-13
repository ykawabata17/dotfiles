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

# --- シークレット・個人設定用ファイル ---
if [ ! -f "$HOME/.zshrc.local" ]; then
  echo ">>> Creating ~/.zshrc.local for secrets..."
  cat > "$HOME/.zshrc.local" << 'SECRETS'
# このファイルは git 管理されません
# API キー・秘密の環境変数・プロジェクト固有 alias をここに書いてください
SECRETS
  echo "  Created: ~/.zshrc.local"
fi

if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo ">>> Creating ~/.gitconfig.local for git identity..."
  cat > "$HOME/.gitconfig.local" << 'GITLOCAL'
[user]
	email = your-email@example.com
	name = Your Name
	# signingkey = ~/.ssh/id_rsa.pub
# [gpg]
# 	format = ssh
# [commit]
# 	gpgsign = true
GITLOCAL
  echo "  Created: ~/.gitconfig.local (set your git identity here)"
fi

echo ""
echo "=== Setup Complete! ==="
echo "Next steps:"
echo "  1. Edit ~/.gitconfig.local to set your git identity"
echo "  2. Edit ~/.zshrc.local to add your secret keys"
echo "  3. Restart your terminal"
