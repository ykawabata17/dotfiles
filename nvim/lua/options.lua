-------------------------------------------------
-- BASIC SETTINGS
-------------------------------------------------
vim.opt.relativenumber = true -- 行数表示を相対表示にする
vim.opt.ai = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.nu = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.shada = "'100,<1000,:10000,h"
vim.opt.history = 10000
vim.opt.ruler = true

-- タブの幅を設定
vim.opt.tabstop = 2 
vim.opt.softtabstop = 2 
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- 検索した単語にハイライトを入れる
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- ステータスライン表示

vim.opt.laststatus = 2
vim.opt.showmode = false
vim.opt.wildmenu = true
vim.opt.cmdheight = 2
vim.opt.wildmode = "list:full"
vim.opt.showcmd = true

