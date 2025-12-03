-- Telescope（ファジーファインダー）の設定

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>",            desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>",             desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",               desc = "Buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>",             desc = "Help Tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>",              desc = "Recent Files" },
    { "<leader>fc", "<cmd>Telescope colorscheme<cr>",           desc = "Colorscheme" },
    { "<leader>fd", "<cmd>Telescope diagnostics<cr>",           desc = "Diagnostics" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>",  desc = "Document Symbols" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
    -- VSCode スタイルは keymaps.lua で定義
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
        },
      },
    })

    -- 拡張機能を読み込み
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
  end,
}
