-- Catppuccin カラーテーマの設定

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- 高優先度で読み込み
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",             -- latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      transparent_background = true, -- 透過設定
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        notify = true,
        mini = false,
        -- 他の統合設定
        neotree = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    -- テーマを設定
    vim.cmd.colorscheme "catppuccin"
  end,
}
