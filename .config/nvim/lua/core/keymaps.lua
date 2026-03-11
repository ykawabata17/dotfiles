-- キーマッピング設定
-- 論理的なグループ分けで整理

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- 基本操作
-- ============================================================================

-- ファイル操作
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
keymap("n", "<leader>W", "<cmd>wa<cr>", { desc = "Save All" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit All" })

-- 検索ハイライト解除
keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear Search Highlight" })

-- 検索結果を中央に表示
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- ============================================================================
-- ウィンドウ操作
-- ============================================================================

keymap("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to Below Window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to Above Window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })

-- ウィンドウサイズ調整
keymap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- ============================================================================
-- バッファ操作 (<leader>b)
-- ============================================================================

keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
-- <leader>bd, <leader>bD は mini.bufremove で定義

-- ============================================================================
-- インデント・移動（ビジュアルモード）
-- ============================================================================

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move Lines Down" })
keymap("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move Lines Up" })

-- ============================================================================
-- ファイルエクスプローラー (<leader>e)
-- ============================================================================

keymap("n", "<C-b>", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })
keymap("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "Focus File Explorer" })

-- ============================================================================
-- LSP 操作 (<leader>l, g*)
-- ============================================================================

-- 診断ナビゲーション
keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
keymap("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- LSP 追加機能
keymap("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })
keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format Document" })
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
keymap("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })

-- ============================================================================
-- テスト (<leader>t) - Neotest
-- ============================================================================

keymap("n", "<leader>tr", function()
	require("neotest").run.run()
end, { desc = "Run Nearest Test" })
keymap("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run File Tests" })
keymap("n", "<leader>tR", function()
	require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Run All Tests" })
keymap("n", "<leader>ts", function()
	require("neotest").run.stop()
end, { desc = "Stop Tests" })
keymap("n", "<leader>to", function()
	require("neotest").output.open({ enter = true })
end, { desc = "Test Output" })
keymap("n", "<leader>tS", function()
	require("neotest").summary.toggle()
end, { desc = "Test Summary" })

-- ============================================================================
-- ターミナル (<leader>T)
-- ============================================================================

keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
keymap("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Move to Left Window" })
keymap("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Move to Below Window" })
keymap("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Move to Above Window" })
keymap("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Move to Right Window" })

-- ============================================================================
-- 検索・置換 (<leader>s)
-- ============================================================================
-- <leader>sr: Spectre (spectre.lua で定義)

keymap("n", "<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search Current Word" })

keymap("v", "<leader>sw", function()
	require("spectre").open_visual()
end, { desc = "Search Selection" })

-- ============================================================================
-- Rails 開発 (<leader>r)
-- ============================================================================

-- vim-rails のキーマップ
keymap("n", "<leader>ra", "<cmd>A<cr>", { desc = "Rails: Alternate File (Test/Code)" })
keymap("n", "<leader>rA", "<cmd>AV<cr>", { desc = "Rails: Alternate in VSplit" })
keymap("n", "<leader>rm", "<cmd>Emodel<cr>", { desc = "Rails: Go to Model" })
keymap("n", "<leader>rc", "<cmd>Econtroller<cr>", { desc = "Rails: Go to Controller" })
keymap("n", "<leader>rv", "<cmd>Eview<cr>", { desc = "Rails: Go to View" })
keymap("n", "<leader>rs", "<cmd>Espec<cr>", { desc = "Rails: Go to Spec" })

-- ============================================================================
-- コピー操作 (<leader>y)
-- ============================================================================

-- ファイルパスのコピー
keymap("n", "<leader>yp", function()
	local path = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy Relative Path" })

keymap("n", "<leader>yP", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy Absolute Path" })

keymap("n", "<leader>yf", function()
	local filename = vim.fn.expand("%:t")
	vim.fn.setreg("+", filename)
	vim.notify("Copied: " .. filename, vim.log.levels.INFO)
end, { desc = "Copy Filename" })

-- ============================================================================
-- その他
-- ============================================================================

-- which-key を手動で開く
keymap("n", "<leader>?", "<cmd>WhichKey<cr>", { desc = "Which Key" })

-- Lazy（プラグインマネージャー）
keymap("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy Plugin Manager" })

-- Mason（LSP インストーラー）
keymap("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason LSP Installer" })
