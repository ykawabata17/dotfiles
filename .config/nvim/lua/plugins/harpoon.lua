-- ファイルナビゲーション（harpoon）の設定

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon Add File",
    },
    {
      "<leader>hh",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Menu",
    },
    {
      "<leader>1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon File 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon File 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon File 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon File 4",
    },
    {
      "<leader>5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon File 5",
    },
  },
  config = function()
    require("harpoon"):setup({})
  end,
}
