-- Git差分表示（diffview）の設定

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  keys = {
    { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
    { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
    { "<leader>gdf", "<cmd>DiffviewFocusFiles<cr>", desc = "DiffView Focus Files" },
    { "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", desc = "DiffView Toggle Files" },
  },
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = false,
      git_cmd = { "git" },
      use_icons = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
        },
        file_history = {
          layout = "diff2_horizontal",
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              max_count = 512,
              follow = true,
            },
            multi_file = {
              max_count = 128,
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
        },
      },
      commit_log_panel = {
        win_config = {},
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        file_panel = {
          ["j"] = "next_entry",
          ["<down>"] = "next_entry",
          ["k"] = "prev_entry",
          ["<up>"] = "prev_entry",
          ["<cr>"] = "select_entry",
          ["o"] = "select_entry",
          ["<2-LeftMouse>"] = "select_entry",
          ["-"] = "toggle_stage_entry",
          ["S"] = "stage_all",
          ["U"] = "unstage_all",
          ["X"] = "restore_entry",
          ["R"] = "refresh_files",
          ["L"] = "open_commit_log",
          ["<c-b>"] = "scroll_view(-0.25)",
          ["<c-f>"] = "scroll_view(0.25)",
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["i"] = "listing_style",
          ["f"] = "toggle_flatten_dirs",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        file_history_panel = {
          ["g!"] = "options",
          ["<C-A-d>"] = "open_in_diffview",
          ["y"] = "copy_hash",
          ["L"] = "open_commit_log",
          ["zR"] = "open_all_folds",
          ["zM"] = "close_all_folds",
          ["j"] = "next_entry",
          ["<down>"] = "next_entry",
          ["k"] = "prev_entry",
          ["<up>"] = "prev_entry",
          ["<cr>"] = "select_entry",
          ["o"] = "select_entry",
          ["<2-LeftMouse>"] = "select_entry",
          ["<c-b>"] = "scroll_view(-0.25)",
          ["<c-f>"] = "scroll_view(0.25)",
          ["<tab>"] = "select_next_entry",
          ["<s-tab>"] = "select_prev_entry",
          ["gf"] = "goto_file",
          ["<C-w><C-f>"] = "goto_file_split",
          ["<C-w>gf"] = "goto_file_tab",
          ["<leader>e"] = "focus_files",
          ["<leader>b"] = "toggle_files",
        },
        option_panel = {
          ["<tab>"] = "select",
          ["q"] = "close",
        },
      },
    })
  end,
}
