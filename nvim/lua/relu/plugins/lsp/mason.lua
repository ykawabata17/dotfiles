return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mson
    local mason = require("mason")

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
  end,
}
