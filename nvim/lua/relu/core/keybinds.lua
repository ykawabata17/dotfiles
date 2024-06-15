vim.g.mapleader = " "

local map = vim.keymap.set

map("n", "<leader>ex", vim.cmd.Ex)

-- 選択した行を上下に移動させる
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- クリップボードにコピー
map("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("v", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Copy to clipboard" })

-- 文字列を置換する
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace string" })

-- 挿入モード
map("i", "<C-a>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })
map("i", "<C-n>", "<C-c>o", { desc = "Next line insert" })
