local M = {}

function M.setup()
  vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    severity_sort = true,
    float = {
      border = "rounded",
      source = true,
    },
  })

  -- LSPのUI設定
  local lsp_defaults = {
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
    },
    diagnostic = {
      virtual_text = { spacing = 4, prefix = "●" },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    },
  }

  -- デフォルト設定を適用
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, lsp_defaults.float
  )
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, lsp_defaults.float
  )
end

return M
