-- Catppuccin カラーテーマの設定

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- 高優先度で読み込み
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",             -- latte, frappe, macchiato, mocha
      transparent_background = true, -- 透過設定
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.15,
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        notify = true,
        neotree = true,
        which_key = true,
      },
    })

    -- テーマを設定
    vim.cmd.colorscheme "catppuccin"
  end,
}
