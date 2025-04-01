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

-- 検索関連
keymap("n", "<leader>h", ":nohlsearch<CR>", opts) -- ハイライト解除
keymap("n", "n", "nzzzv", opts)                   -- 検索結果の次へ (中央表示)
keymap("n", "N", "Nzzzv", opts)                   -- 検索結果の前へ (中央表示)

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

-- neotest
keymap("n", "<leader>nr", "<Cmd>lua require('neotest').run.run()<CR>", { desc = "Run the nearest test" })
keymap("n", "<leader>nf", "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run the tests of current file" })
keymap("n", "<leader>nR", "<Cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>", { desc = "Run all tests" })
keymap("n", "<leader>nS", "<Cmd>lua require('neotest').stop()<CR>", { desc = "Stop the tests" })
keymap("n", "<leader>no", "<Cmd>lua require('neotest').output.open({ enter = true })<CR>", { desc = "Open output" })
keymap("n", "<leader>ns", "<Cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Open summary" })

-- その他の便利なキーマップ
keymap("n", "<leader>w", ":w<CR>", opts)   -- 保存
keymap("n", "<leader>q", ":q<CR>", opts)   -- 終了
keymap("n", "<leader>wq", ":wq<CR>", opts) -- 保存して終了
keymap("n", "<leader>wa", ":wa<CR>", opts) -- すべて保存
