-- 診断リスト表示（trouble）の設定

return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = {
    position = "bottom",
    height = 10,
    width = 50,
    icons = true,
    mode = "workspace_diagnostics",
    severity = nil,
    fold_open = "",
    fold_closed = "",
    group = true,
    padding = true,
    indent_lines = true,
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    signs = {
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
    use_diagnostic_signs = false,
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics" },
    { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List" },
    { "gR",         "<cmd>TroubleToggle lsp_references<cr>",        desc = "LSP References" },
  },
}
