-- 移動強化（flash）の設定

return {
  "folke/flash.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = true,
      incremental = true,
    },
    jump = {
      autojump = true,
    },
    modes = {
      char = {
        enabled = true,
        keys = { "f", "F", "t", "T", ";" },
      },
    },
  },
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
