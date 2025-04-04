-- 通知プラグインの設定

return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      fps = 60,
      icons = {
        DEBUG = "!",
        ERROR = " ",
        INFO = " ",
        TRACE = "✎",
        WARN = " ",
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 3000,
      top_down = true,
    })

    vim.notify = require("notify")
  end,
}
