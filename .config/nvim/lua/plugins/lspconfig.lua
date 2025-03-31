return {
  {
    -- Mason-lspconfig (MasonとLSPconfigの連携)
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "solargraph", -- Ruby
          "clangd",     -- C/C++
          "eslint",
          "tailwindcss",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    -- LSP設定: lspconfig
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim", -- Neovim Lua API開発用
    },
    config = function()
      -- Neodev (Neovim Lua API開発用)
      require("neodev").setup()

      -- LSPの機能をキーマップに設定
      local function on_attach(client, bufnr)
        -- キーマップ設定
        local function map(mode, lhs, rhs, desc)
          if desc then
            desc = "LSP: " .. desc
          end
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- LSP関連のキーマップ
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
        map("n", "<leader>D", vim.lsp.buf.type_definition, "Type Definition")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "gr", vim.lsp.buf.references, "References")

        -- インラインヒント
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable = true
        end
      end

      -- LSPサーバーの設定
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- 各LSPサーバーの設定
      local servers = {
        -- Lua
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              telemetry = { enable = false },
            },
          },
        },

        -- YAML
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
            },
          },
        },

        -- ESLint
        eslint = {
          settings = {
            packageManager = "npm",
            autoFixOnSave = true,
          },
        },
      }

      -- Mason-lspconfigを使用してLSPサーバーを設定
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local server_config = servers[server_name] or {}
          server_config.capabilities = capabilities
          server_config.on_attach = on_attach
          lspconfig[server_name].setup(server_config)
        end,
      })
    end,
  },

  {
    -- Neodev (Neovim Lua API開発用)
    "folke/neodev.nvim",
    lazy = true,
  },
}
