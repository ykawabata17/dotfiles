return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
      },

      -- 色が見づらすぎるものを書き換える 
      on_highlights = function(hl, colors)
        -- 行番号
        hl.LineNr = {
          fg = colors.yellow 
        }
        hl.CursorLineNr = {
          fg = colors.yellow 
        }
        -- コメント
        hl.comment = {
          fg = colors.yellow
        }
        -- lsp のモーダルの色
        hl.LspReferenceWrite = {
          bg = "#3b4261",
          fg = "#d8dee9",
        }
      end
    })
    vim.cmd("colorscheme tokyonight")
  end
}
