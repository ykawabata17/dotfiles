-- Alpha スタート画面の設定

return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- ヘッダー
    dashboard.section.header.val = {
      "               ▄▀▄     ▄▀▄               ",
      "              ▄█░░▀▀▀▀▀░░█▄              ",
      "          ▄▄  █░░░░░░░░░░░█  ▄▄          ",
      "         █▄▄█ █░░▀░░┬░░▀░░█ █▄▄█         ",
      "          ███████████████████            ",
      "           █████████████████             ",
      "            ▀████████████▀               ",
      "              ▀██████▀                   ",
      "                                         ",
      "            ╔╗╔╔═╗╔═╗╦  ╦╦╔╦╗            ",
      "            ║║║║╣ ║ ║╚╗╔╝║║║║            ",
      "            ╝╚╝╚═╝╚═╝ ╚╝ ╩╩ ╩            ",
      "                                         ",
    }

    -- メニュー
    dashboard.section.buttons.val = {
      dashboard.button("f", "  > Find file", ":Telescope find_files <CR>"),
      dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "  > Recent File", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "  > Text search", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  > Setting", ":e $MYVIMRC <CR>"),
      dashboard.button("q", "  > QUIT", ":qa<CR>"),
    }

    -- フッター
    local function footer()
      local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
      local version = vim.version()
      local nvim_version = "  v" .. version.major .. "." .. version.minor .. "." .. version.patch
      return datetime .. "   " .. nvim_version
    end
    dashboard.section.footer.val = footer()

    -- レイアウト
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- 設定を適用
    alpha.setup(dashboard.config)
  end,
}
