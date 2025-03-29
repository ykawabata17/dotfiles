-- 基本設定オプション

local opt = vim.opt
local g = vim.g

-- リーダーキーの設定
g.mapleader = " "
g.maplocalleader = " "

-- エンコーディング
opt.fileencoding = "utf-8"

-- 行番号表示
opt.number = true
opt.relativenumber = true
-- カーソル行の強調表示
opt.cursorline = true

-- インデント設定
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- 検索設定
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- UI設定
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.showmode = false

-- バックアップ・スワップファイル
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.undofile = true

-- クリップボード
opt.clipboard = "unnamedplus"

-- スプリット設定
opt.splitbelow = true
opt.splitright = true

-- その他
opt.updatetime = 100
opt.timeoutlen = 300
opt.conceallevel = 0
opt.pumheight = 10
opt.showtabline = 2
opt.mouse = "a"

-- 折りたたみ設定
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.foldlevel = 99
opt.foldlevelstart = 99
