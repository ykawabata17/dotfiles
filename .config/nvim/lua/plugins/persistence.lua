-- セッション管理（persistence）の設定

return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
    options = { "buffers", "curdir", "tabpages", "winsize" },
    pre_save = nil,
  },
  keys = {
    { "<leader>ss", function() require("persistence").load() end,                desc = "Load Session" },
    { "<leader>sl", function() require("persistence").load({ last = true }) end, desc = "Load Last Session" },
    { "<leader>sd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
  },
}
