-- 構文解析（treesitter）の設定

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      enable = true,
      enable_autocmd = false,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "ruby",
        "c",
        "cpp",
        "bash",
        "regex",
        "git_rebase",
        "gitcommit",
        "gitignore",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            ["ai"] = "@conditional.outer",
            ["ii"] = "@conditional.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.outer",
            ["ad"] = "@comment.outer",
            ["am"] = "@call.outer",
            ["im"] = "@call.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
            ["]l"] = "@loop.outer",
            ["]i"] = "@conditional.outer",
            ["]b"] = "@block.outer",
            ["]s"] = "@statement.outer",
            ["]d"] = "@comment.outer",
            ["]m"] = "@call.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
            ["]L"] = "@loop.outer",
            ["]I"] = "@conditional.outer",
            ["]B"] = "@block.outer",
            ["]S"] = "@statement.outer",
            ["]D"] = "@comment.outer",
            ["]M"] = "@call.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
            ["[l"] = "@loop.outer",
            ["[i"] = "@conditional.outer",
            ["[b"] = "@block.outer",
            ["[s"] = "@statement.outer",
            ["[d"] = "@comment.outer",
            ["[m"] = "@call.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
            ["[L"] = "@loop.outer",
            ["[I"] = "@conditional.outer",
            ["[B"] = "@block.outer",
            ["[S"] = "@statement.outer",
            ["[D"] = "@comment.outer",
            ["[M"] = "@call.outer",
          },
        },
      },
      autotag = { enable = true },
    })
  end,
}
