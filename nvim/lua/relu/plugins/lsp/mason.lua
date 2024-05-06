return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mson
    local mason = require("mason")

    local mason_tool_installer = require("mason-tool-installer")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✔︎",
          package_pending = "→",
          package_uninstlled = "x",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to instll
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "ruby_lsp",
        "solargraph",
        "rubocop",
        "sqlls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
      }
    })
  end,
}
