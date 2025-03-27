-- コメントトグルプラグインの設定

return {
  "numToStr/Comment.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = "gcc",
        block = "gbc",
      },
      opleader = {
        line = "gc",
        block = "gb",
      },
      extra = {
        above = "gcO",
        below = "gco",
        eol = "gcA",
      },
      mappings = {
        basic = true,
        extra = true,
      },
      pre_hook = nil,
      post_hook = nil,
    })

    -- VSCodeライクなコメントトグルキーマップ
    vim.keymap.set("n", "<C-/>", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle comment" })

    vim.keymap.set("x", "<C-/>", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "nx", false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment for selection" })
  end,
}
