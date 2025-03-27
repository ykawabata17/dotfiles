-- Git操作（fugitive）の設定

return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gstatus", "Gblame", "Gpush", "Gpull" },
  keys = {
    { "<leader>gg", "<cmd>Git<cr>", desc = "Git Status" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
    { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    { "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git Fetch" },
    { "<leader>gm", "<cmd>Git merge<cr>", desc = "Git Merge" },
    { "<leader>gbl", "<cmd>Git blame<cr>", desc = "Git Blame" },
  },
}
