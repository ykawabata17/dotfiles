-- キーマッピング設定
-- VSCodeライクなキーバインドを設定

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ノーマルモード --
-- ウィンドウ操作
keymap("n", "<C-h>", "<C-w>h", opts) -- 左のウィンドウへ
keymap("n", "<C-j>", "<C-w>j", opts) -- 下のウィンドウへ
keymap("n", "<C-k>", "<C-w>k", opts) -- 上のウィンドウへ
keymap("n", "<C-l>", "<C-w>l", opts) -- 右のウィンドウへ

-- ウィンドウサイズ調整
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- バッファ操作
keymap("n", "<S-l>", ":bnext<CR>", opts)       -- 次のバッファへ
keymap("n", "<S-h>", ":bprevious<CR>", opts)   -- 前のバッファへ
keymap("n", "<leader>c", ":bdelete<CR>", opts) -- バッファを閉じる (VSCodeの閉じるタブ)

-- インデント調整を維持
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ビジュアルモードでの複数行移動
keymap("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })

-- 貼り付け時に選択範囲を上書きしても、レジスタを上書きしない
keymap("v", "p", '"_dP', opts)

-- 検索関連
keymap("n", "<leader>h", ":nohlsearch<CR>", opts) -- ハイライト解除
keymap("n", "n", "nzzzv", opts)                   -- 検索結果の次へ (中央表示)
keymap("n", "N", "Nzzzv", opts)                   -- 検索結果の前へ (中央表示)

-- VSCodeライクなコマンド
keymap("n", "<C-s>", ":w<CR>", opts)                                                    -- 保存
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)                                              -- 挿入モードでの保存
keymap("n", "<C-q>", ":q<CR>", opts)                                                    -- 終了
keymap("n", "<C-/>", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts) -- コメントトグル

-- ファイルエクスプローラー (Neo-tree)
keymap("n", "<C-b>", ":Neotree toggle<CR>", opts)    -- サイドバートグル (VSCodeのエクスプローラー)
keymap("n", "<leader>e", ":Neotree focus<CR>", opts) -- エクスプローラーにフォーカス

-- Telescope (VSCodeのクイックオープン等)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)     -- ファイル検索
keymap("n", "<C-f>", ":Telescope live_grep<CR>", opts)      -- グローバル検索
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)   -- バッファリスト
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts) -- ヘルプタグ

-- ターミナル
keymap("n", "<leader>t", ":terminal<CR>", opts) -- ターミナル起動
keymap("t", "<Esc>", "<C-\\><C-n>", opts)       -- ターミナルモード終了

-- LSP関連
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)           -- 定義へジャンプ
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)           -- 参照を検索
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)                 -- ホバー情報表示
keymap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)       -- リネーム
keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)  -- コードアクション
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)        -- フォーマット
keymap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)         -- 前の診断へ
keymap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)         -- 次の診断へ
keymap("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>", opts) -- 診断を表示

-- その他の便利なキーマップ
keymap("n", "<leader>w", ":w<CR>", opts)   -- 保存
keymap("n", "<leader>q", ":q<CR>", opts)   -- 終了
keymap("n", "<leader>wq", ":wq<CR>", opts) -- 保存して終了
keymap("n", "<leader>wa", ":wa<CR>", opts) -- すべて保存
