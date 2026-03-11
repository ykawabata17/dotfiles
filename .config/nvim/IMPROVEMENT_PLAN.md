# Neovim 設定改善計画

作成日: 2025-12-04

## 現状の分析

### ディレクトリ構成（リファクタリング後）

```
lua/
├── core/                    # コア設定
│   ├── diagnostics.lua      # LSP診断とハンドラ設定
│   ├── keymaps.lua          # キーマッピング定義
│   └── options.lua          # Neovim基本オプション設定
└── plugins/                 # プラグイン設定
    ├── init.lua             # lazy.nvim設定 + 基本プラグイン
    ├── editor/              # エディタ拡張
    │   ├── accelerated.lua  # 高速移動
    │   ├── autopairs.lua    # 自動括弧閉じ
    │   ├── flash.lua        # 移動強化
    │   ├── harpoon.lua      # ファイルナビゲーション
    │   ├── mini.lua         # Mini.nvimプラグイン
    │   ├── neo-tree.lua     # ファイルエクスプローラー
    │   ├── spectre.lua      # 検索/置換強化
    │   ├── surround.lua     # サラウンド操作
    │   └── telescope.lua    # ファジーファインダー
    ├── lang/                # 言語固有
    │   ├── neotest.lua      # テスト実行（RSpec/Go）
    │   └── treesitter.lua   # 構文解析/ハイライト
    ├── lsp/                 # LSP/補完関連
    │   ├── cmp.lua          # 補完エンジン
    │   ├── conform.lua      # フォーマッター
    │   ├── lint.lua         # リンター
    │   ├── lspconfig.lua    # LSP設定
    │   ├── mason.lua        # LSPインストーラー
    │   └── trouble.lua      # 診断リスト
    ├── tools/               # ツール
    │   ├── persistence.lua  # セッション管理
    │   └── toggleterm.lua   # ターミナル
    └── ui/                  # UI関連
        ├── alpha.lua        # スタート画面
        ├── bufferline.lua   # バッファライン
        ├── catppuccin.lua   # カラーテーマ
        ├── hlchunk.lua      # インデント表示強化
        ├── lualine.lua      # ステータスライン
        ├── notify.lua       # 通知プラグイン
        └── whichkey.lua     # キーバインドヘルパー
```

---

## 改善提案

### 1. Ruby/Rails 開発向けの改善

#### 追加すべきプラグイン

| プラグイン | 用途 | 理由 |
|-----------|------|------|
| **vim-endwise** | `end` の自動挿入 | `def`, `do`, `if` などの後に自動で `end` を挿入 |
| **vim-ruby** | Ruby サポート強化 | インデントやモーションの改善 |
| **nvim-lint** | リアルタイム Lint | conform は formatter のみなので、Rubocop の警告をリアルタイム表示 |
| **trouble.nvim** | 診断リスト | LSP エラー/警告を一覧表示できる |
| **todo-comments.nvim** | TODO ハイライト | `TODO:`, `FIXME:` などをハイライト＆検索 |

#### LSP の改善

- [x] `solargraph` → `ruby_lsp` への移行（より高速でモダン、Shopify 製）
- [ ] `sorbet` もオプションとして検討可能

### 2. キーマップの改善

#### 不足しているキーマップ

- **ファイル間移動**: Rails の `app/models/user.rb` ↔ `spec/models/user_spec.rb` 間のジャンプ
- **メソッド間移動**: `[m` / `]m` でメソッド間を移動
- **ブロック間移動**: `[[` / `]]` でクラス/モジュール間を移動
- **選択範囲の拡大/縮小**: Treesitter ベースのインクリメンタル選択

#### 改善できるキーマップ

- `<leader>c` でバッファを閉じていますが、`mini.bufremove` の `<leader>bd` と重複
- Neotest のキーマップが `<leader>n*` で多いですが、`<leader>t*` の方が直感的（Test）

### 3. 構成のリファクタリング案

```
lua/
├── core/
│   ├── init.lua      # コア設定のエントリポイント（新規）
│   ├── options.lua
│   ├── keymaps.lua
│   └── autocmds.lua  # 自動コマンドを分離（新規）
├── lsp/
│   ├── init.lua
│   ├── servers/      # サーバー別設定（新規）
│   │   ├── ruby.lua
│   │   ├── typescript.lua
│   │   └── ...
│   └── keymaps.lua   # LSP キーマップを分離（新規）
└── plugins/
    ├── init.lua      # lazy.nvim 本体の設定のみに
    ├── editor/       # エディタ拡張（新規）
    │   ├── telescope.lua
    │   ├── flash.lua
    │   └── ...
    ├── ui/           # UI 関連（新規）
    │   ├── catppuccin.lua
    │   ├── lualine.lua
    │   └── ...
    ├── lsp/          # LSP/補完関連（新規）
    │   ├── lspconfig.lua
    │   ├── cmp.lua
    │   └── ...
    └── lang/         # 言語固有（新規）
        ├── ruby.lua
        └── ...
```

### 4. 設定の問題点・改善ポイント

| ファイル | 問題点 | 改善案 |
|---------|--------|--------|
| `plugins/init.lua` | プラグイン定義が混在（基本プラグインと個別ファイル） | 全て個別ファイルに移動 |
| `core/keymaps.lua` | LSP キーマップがここと lspconfig.lua の両方にある | 一箇所に統一 |
| `plugins/neotest.lua` | Docker コマンドがハードコード | 環境変数やプロジェクト固有設定に |
| `plugins/conform.lua` | Rubocop の設定がデフォルトのまま | `--server` フラグで高速化可能 |

### 5. パフォーマンス改善

- **lazy loading の強化**: 現在も `event`, `cmd` で遅延読み込みしていますが、`keys` でも遅延可能
- **LSP の遅延起動**: `LspInfo` で確認して不要な LSP が起動していないか確認

### 6. 追加すると便利な機能

| 機能 | プラグイン | 説明 |
|------|-----------|------|
| **マルチカーソル** | vim-visual-multi | 複数箇所を同時編集 |
| **Git blame** | gitsigns で既存だが表示が弱い | 行ごとの blame 表示 |
| **Rails コンソール統合** | toggleterm のカスタム | `<leader>rc` で Rails console 起動 |
| **デバッガ** | nvim-dap + nvim-dap-ruby | ブレークポイントでデバッグ |
| **Copilot Chat** | CopilotChat.nvim | コードについて AI と会話 |

---

## 推奨する優先度

### 高優先度（すぐに効果あり）

1. [x] `ruby_lsp` への移行
2. [x] `trouble.nvim` の追加
3. [x] キーマップの整理（重複解消、Rails 用ジャンプ追加）
4. [x] `nvim-lint` の追加

### 中優先度（開発効率向上）

1. [x] ディレクトリ構成のリファクタリング
2. [ ] `todo-comments.nvim` の追加
3. [x] Neotest のキーマップ見直し（`<leader>n*` → `<leader>t*`）

### 低優先度（お好みで）

1. [ ] `CopilotChat.nvim` の追加
2. [ ] デバッガの追加
3. [ ] マルチカーソル

---

## 変更履歴

### 2025-12-04

- [x] `solargraph` → `ruby_lsp` に移行
- [x] `trouble.nvim` を追加（LSP診断の一覧表示）
- [x] キーマップの大幅リファクタリング
  - 重複解消（`<leader>c` vs `<leader>bd` など）
  - 論理的なグループ分け（`<leader>b`: バッファ、`<leader>g`: Git、`<leader>l`: LSP、`<leader>t`: テスト、`<leader>T`: ターミナル、`<leader>r`: Rails、`<leader>y`: コピー、`<leader>x`: Trouble、`<leader>s`: 検索/置換、`<leader>S`: セッション）
  - Rails 用キーマップ追加（`<leader>ra`: 代替ファイル、`<leader>rm/rc/rv/rs`: Model/Controller/View/Spec）
  - Git 操作キーマップ拡充（`<leader>gb/gd/gh/gr/gs` など）
  - ウィンドウサイズ調整キーマップ追加（`<C-Up/Down/Left/Right>`）
- [x] `nvim-lint` を追加（リアルタイム Linter）
  - Ruby: `rubocop`
  - JavaScript/TypeScript: `eslint_d`
  - Markdown: `markdownlint`
  - YAML: `yamllint`
  - `<leader>ll` で手動 Lint 実行
- [x] ディレクトリ構成のリファクタリング
  - `plugins/` をカテゴリ別に分割: `ui/`, `editor/`, `lsp/`, `lang/`, `tools/`
  - `lsp/init.lua` → `core/diagnostics.lua` に移動
  - `plugins/init.lua` を整理（基本プラグイン + サブディレクトリのインポート）
  - 遅延読み込みの最適化（`event`, `ft`, `cmd`, `keys` を適切に設定）
