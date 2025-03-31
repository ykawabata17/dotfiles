-- Mini.nvimプラグインの設定

return {
  -- ファイル操作強化: mini.files
  {
    "echasnovski/mini.files",
    keys = {
      {
        "<leader>fe",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open Mini Files (Current File)",
      },
      {
        "<leader>fE",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Open Mini Files (cwd)",
      },
    },
    opts = {
      windows = {
        width_focus = 30,
        width_preview = 30,
      },
    },
  },

  -- テキストオブジェクト: mini.ai
  {
    "echasnovski/mini.ai",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
    end,
  },

  -- バッファ削除: mini.bufremove
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
}
