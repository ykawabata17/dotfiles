return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- 起動時画面を設定する
    dashboard.section.header.vla = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- メニューを設定する
    dashboard.section.buttons.val = {
      dashboard.button("e", "📄 > New File", "<cmd>end<CR>"),
      dashboard.button("SPC ee", "📁 > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "📁🔍 > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "🔍 > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("q", "📄 > New File", "<cmd>qa<CR>"),
    }

    -- 設定を反映する
    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType lpha setlocl nofoldenble]])
  end,
}

