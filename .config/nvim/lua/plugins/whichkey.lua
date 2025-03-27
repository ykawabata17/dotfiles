return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local which_key = require("which-key")

    which_key.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          win = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      replace = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },
    })

    -- キーマッピングのグループ設定（新しい形式）
    which_key.register({
      ["<leader>f"] = { group = "ファイル/検索" },
      ["<leader>g"] = { group = "Git" },
      ["<leader>l"] = { group = "LSP" },
      ["<leader>s"] = { group = "セッション" },
      ["<leader>t"] = { group = "ターミナル" },
      ["<leader>w"] = { group = "ウィンドウ" },
    })
  end,
}
