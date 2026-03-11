# Neovim キーマップ一覧

> `<leader>` = スペースキー

## 基本操作

| キー | 説明 |
|------|------|
| `<leader>w` | 保存 |
| `<leader>W` | すべて保存 |
| `<leader>q` | 終了 |
| `<leader>Q` | すべて終了 |
| `<Esc>` | 検索ハイライト解除 |
| `n` / `N` | 検索結果の次/前へ（中央表示） |

---

## ウィンドウ操作

| キー | 説明 |
|------|------|
| `<C-h>` | 左のウィンドウへ移動 |
| `<C-j>` | 下のウィンドウへ移動 |
| `<C-k>` | 上のウィンドウへ移動 |
| `<C-l>` | 右のウィンドウへ移動 |
| `<C-Up>` | ウィンドウの高さを増やす |
| `<C-Down>` | ウィンドウの高さを減らす |
| `<C-Left>` | ウィンドウの幅を減らす |
| `<C-Right>` | ウィンドウの幅を増やす |

---

## バッファ操作 (`<leader>b`)

| キー | 説明 |
|------|------|
| `<S-h>` | 前のバッファへ |
| `<S-l>` | 次のバッファへ |
| `<leader>bb` | 直前のバッファへ切り替え |
| `<leader>bd` | バッファを閉じる |
| `<leader>bD` | バッファを強制的に閉じる |

---

## ファイル検索 (`<leader>f`) - Telescope

| キー | 説明 |
|------|------|
| `<C-p>` | ファイル検索 |
| `<C-f>` | テキスト検索（grep） |
| `<leader>ff` | ファイル検索 |
| `<leader>fg` | テキスト検索（Live Grep） |
| `<leader>fb` | バッファ一覧 |
| `<leader>fh` | ヘルプタグ検索 |
| `<leader>fr` | 最近開いたファイル |
| `<leader>fc` | カラースキーム |
| `<leader>fd` | 診断一覧 |
| `<leader>fs` | ドキュメントシンボル |
| `<leader>fS` | ワークスペースシンボル |

---

## ファイルエクスプローラー (`<leader>e`)

| キー | 説明 |
|------|------|
| `<C-b>` | Neo-tree 開閉 |
| `<leader>e` | Neo-tree にフォーカス |
| `<leader>fe` | Mini Files（現在のファイル） |
| `<leader>fE` | Mini Files（カレントディレクトリ） |

### Neo-tree 内キー

| キー | 説明 |
|------|------|
| `<` | 幅を狭める（-5） |
| `>` | 幅を広げる（+5） |

---

## Git 操作 (`<leader>g`)

| キー | 説明 |
|------|------|
| `<leader>gg` | LazyGit を開く |
| `<leader>gb` | Git Blame（現在行） |
| `<leader>gB` | Git Blame 表示切り替え |
| `<leader>gd` | Git Diff（現在ファイル） |
| `<leader>gD` | Diffview を開く |
| `<leader>gh` | Hunk プレビュー |
| `<leader>gr` | Hunk をリセット |
| `<leader>gR` | バッファ全体をリセット |
| `<leader>gs` | Hunk をステージ |
| `<leader>gS` | バッファ全体をステージ |
| `]h` | 次の Hunk へ |
| `[h` | 前の Hunk へ |

---

## LSP 操作 (`<leader>l`, `g*`)

| キー | 説明 |
|------|------|
| `gd` | 定義へジャンプ |
| `gD` | 宣言へジャンプ |
| `gr` | 参照一覧 |
| `gi` | 実装へジャンプ |
| `K` | ホバー（ドキュメント表示） |
| `<C-k>` | シグネチャヘルプ |
| `<leader>ca` | コードアクション |
| `<leader>D` | 型定義へジャンプ |
| `<leader>ld` | 行の診断を表示 |
| `<leader>lr` | シンボル名変更 |
| `<leader>lf` | フォーマット |
| `<leader>li` | LSP 情報 |
| `<leader>lR` | LSP 再起動 |
| `<leader>ll` | Lint 実行 |
| `[d` | 前の診断へ |
| `]d` | 次の診断へ |

---

## Trouble（診断一覧） (`<leader>x`)

| キー | 説明 |
|------|------|
| `<leader>xx` | 診断一覧（全ファイル） |
| `<leader>xX` | 診断一覧（現在のバッファ） |
| `<leader>xs` | シンボル一覧 |
| `<leader>xl` | LSP 定義/参照 |
| `<leader>xL` | Location List |
| `<leader>xq` | Quickfix List |

---

## テスト (`<leader>t`) - Neotest

| キー | 説明 |
|------|------|
| `<leader>tr` | 最も近いテストを実行 |
| `<leader>tf` | ファイル全体のテストを実行 |
| `<leader>tR` | 全テストを実行 |
| `<leader>ts` | テストを停止 |
| `<leader>to` | テスト出力を表示 |
| `<leader>tS` | テストサマリーを表示 |

---

## ターミナル (`<leader>T`)

| キー | 説明 |
|------|------|
| `<F7>` | ターミナル開閉 |
| `<leader>Tt` | フロートターミナル |
| `<leader>Th` | 水平ターミナル |
| `<leader>Tv` | 垂直ターミナル |
| `<Esc><Esc>` | ターミナルモード終了 |

---

## Rails 開発 (`<leader>r`)

| キー | 説明 |
|------|------|
| `<leader>ra` | テスト ↔ コード切り替え |
| `<leader>rA` | テスト ↔ コード切り替え（垂直分割） |
| `<leader>rm` | Model へ移動 |
| `<leader>rc` | Controller へ移動 |
| `<leader>rv` | View へ移動 |
| `<leader>rs` | Spec へ移動 |

---

## 検索・置換 (`<leader>s`) - Spectre

| キー | 説明 |
|------|------|
| `<leader>sr` | Spectre を開く |
| `<leader>sw` | カーソル下の単語を検索 |
| `<leader>sw` (Visual) | 選択範囲を検索 |

---

## コピー操作 (`<leader>y`)

| キー | 説明 |
|------|------|
| `<leader>yp` | 相対パスをコピー |
| `<leader>yP` | 絶対パスをコピー |
| `<leader>yf` | ファイル名をコピー |

---

## セッション (`<leader>S`)

| キー | 説明 |
|------|------|
| `<leader>Ss` | セッションを読み込む |
| `<leader>Sl` | 最後のセッションを読み込む |
| `<leader>Sd` | セッションを保存しない |

---

## Harpoon (`<leader>h`)

| キー | 説明 |
|------|------|
| `<leader>ha` | ファイルを追加 |
| `<leader>hh` | Harpoon メニュー |
| `<leader>1` | Harpoon ファイル 1 |
| `<leader>2` | Harpoon ファイル 2 |
| `<leader>3` | Harpoon ファイル 3 |
| `<leader>4` | Harpoon ファイル 4 |
| `<leader>5` | Harpoon ファイル 5 |

---

## 移動 - Flash

| キー | 説明 |
|------|------|
| `s` | Flash ジャンプ |
| `S` | Flash Treesitter |
| `f` / `F` | 文字検索（拡張） |
| `t` / `T` | 文字前検索（拡張） |

---

## 編集

| キー | 説明 |
|------|------|
| `<C-/>` | コメント切り替え |
| `<` / `>` (Visual) | インデント調整（選択維持） |
| `J` / `K` (Visual) | 行を上下に移動 |

### Surround（囲み操作）

| キー | 説明 |
|------|------|
| `ys{motion}{char}` | 囲みを追加（例: `ysiw"` で単語を `"` で囲む） |
| `cs{old}{new}` | 囲みを変更（例: `cs"'` で `"` を `'` に変更） |
| `ds{char}` | 囲みを削除（例: `ds"` で `"` を削除） |

---

## その他

| キー | 説明 |
|------|------|
| `<leader>?` | Which Key を開く |
| `<leader>L` | Lazy（プラグインマネージャー）を開く |
| `<leader>M` | Mason（LSP インストーラー）を開く |

---

## プレフィックス早見表

| プレフィックス | 用途 |
|---------------|------|
| `<leader>b` | **B**uffer（バッファ） |
| `<leader>f` | **F**ind（検索） |
| `<leader>g` | **G**it |
| `<leader>h` | **H**arpoon |
| `<leader>l` | **L**SP |
| `<leader>r` | **R**ails |
| `<leader>s` | **S**earch/Replace（検索・置換） |
| `<leader>S` | **S**ession（セッション） |
| `<leader>t` | **T**est（テスト） |
| `<leader>T` | **T**erminal（ターミナル） |
| `<leader>x` | E**x**tra / Trouble（診断） |
| `<leader>y` | **Y**ank（コピー） |
