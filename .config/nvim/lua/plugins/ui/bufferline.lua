-- Bufferline バッファラインの設定

return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        local icons = {
          Error = " ",
          Warn = " ",
          Hint = "󱩎 ",
          Info = " ",
        }
        local ret = {}
        for name, icon in pairs(icons) do
          if diag[name] then
            table.insert(ret, icon .. diag[name])
          end
        end
        return table.concat(ret, " ")
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true,
        },
      },
      indicator = {
        icon = "▎",
        style = "underline",
      }
    },
  },
}
