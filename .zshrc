# --- 環境変数の設定 ---
export LANG=ja_JP.UTF-8
export EDITOR='nvim' # 将来的にNeovimをデフォルトエディタに

# 補完の強化
# source /opt/homebrew/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# 補完有効化
# autoload -Uz compinit
# compinit


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# ---------------------------------
# aliasを設定する
# プロジェクト固有の alias は .zshrc.local に記載
alias cl='clear'
alias v='nvim'
alias g='git'
alias gs='git switch'
alias gc='git checkout'
alias glo='git log --oneline'
alias dcp='docker compose exec puma'
alias dcf='docker compose exec front'
alias lg='lazygit'
# ---------------------------------

# -----------------------------
# ここから rbenv の設定
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"
eval "$(rbenv init - zsh)"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
# -----------------------------

# シークレットは .zshrc.local に記載（git 管理外）
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Cline Integraion in VSCode
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

LISTMAX=0

# Gemini CLI 用の API key は .zshrc.local に記載

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

# --- Sheldon (プラグインマネージャ) の初期化 ---
eval "$(sheldon source)"

# --- Starship (プロンプト) の初期化 ---
eval "$(starship init zsh)"

# --- Modern Tools の初期化 & エイリアス ---
# zoxide (cd の代わり)
eval "$(zoxide init zsh)"
alias cd='z' # cd と打っても zoxide が動くようにする

# eza (ls の代わり / アイコン・Git状態付き)
alias ls='eza --icons --git'
alias ll='eza -al --icons --git'
alias lt='eza -T -L 2 --icons --git' # ツリー表示

# bat (cat の代わり)
alias cat='bat'

# fzf (Ctrl+R で履歴検索をリッチに)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# Claude Code
alias claude="$HOME/.claude/local/claude"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem="$HOME/.bun/bin/bun $HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"

# Homebrew一括アップデート関数
brewup() {
  set -e  # エラーが発生したらそこで中断する
  echo "== brew update =="
  brew update
  echo ""
  
  echo "== brew upgrade (formula) =="
  brew upgrade
  echo ""
  
  echo "== brew upgrade (cask, greedy) =="
  brew upgrade --cask --greedy
  echo ""
  
  echo "== brew cleanup =="
  brew cleanup
  echo ""
  
  echo "== brew autoremove =="
  brew autoremove
  echo ""
  
  echo "✅ brew update all done"
}
