-- プラグイン管理設定
-- lazy.nvim を使用してプラグインを管理します

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 安定版を使用
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの設定
require("lazy").setup({
  -- シンプルなプラグイン設定
  -- アイコン
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        override = {},
        default = true,
      })
    end,
  },

  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup(
        vim.keymap.set("n", "<C-/>", function()
          require("Comment.api").toggle.linewise.current()
        end, { desc = "Toggle comment" }),

        vim.keymap.set("x", "<C-/>", function()
          local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
          vim.api.nvim_feedkeys(esc, "nx", false)
          require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment for selection" })
      )
    end,
  },

  { 'echasnovski/mini.icons',      version = false },

  -- JSON Schema Store
  {
    "b0o/schemastore.nvim",
    lazy = true,
  },

  -- プレナリー（多くのプラグインの依存関係）
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- 個別のプラグイン設定ファイルをインポート
  { import = "plugins.catppuccin" },  -- カラーテーマ
  { import = "plugins.alpha" },       -- スタート画面
  { import = "plugins.accelerated" }, -- 高速移動
  { import = "plugins.lualine" },     -- ステータスライン
  { import = "plugins.bufferline" },  -- バッファライン
  { import = "plugins.notify" },      -- 通知
  { import = "plugins.hlchunk" },     -- インデント表示
  { import = "plugins.neo-tree" },    -- ファイルエクスプローラー
  { import = "plugins.telescope" },   -- ファジーファインダー
  { import = "plugins.cmp" },         -- 補完エンジン
  { import = "plugins.copilot" },     -- GitHub Copilot
  { import = "plugins.autopairs" },   -- 自動括弧閉じ
  { import = "plugins.surround" },    -- サラウンド操作
  { import = "plugins.whichkey" },    -- キーバインドヘルパー
  { import = "plugins.mason" },       -- LSPインストーラー
  { import = "plugins.lspconfig" },   -- LSP設定
  { import = "plugins.treesitter" },  -- 構文解析
  { import = "plugins.conform" },     -- フォーマッター
  { import = "plugins.lint" },        -- リンター
  { import = "plugins.gitsigns" },    -- Git統合
  { import = "plugins.fugitive" },    -- Git操作
  { import = "plugins.diffview" },    -- Git差分表示
  { import = "plugins.toggleterm" },  -- ターミナル
  { import = "plugins.persistence" }, -- セッション管理
  { import = "plugins.spectre" },     -- 検索/置換強化
  { import = "plugins.mini" },        -- Mini.nvimプラグイン
  { import = "plugins.leap" },        -- 移動強化
  { import = "plugins.flash" },       -- 移動強化
  { import = "plugins.harpoon" },     -- ファイルナビゲーション

  -- インストール設定
  install = {
    -- カラフルなアイコンを表示
    colorscheme = { "catppuccin" },
  },

  -- UIのカスタマイズ
  ui = {
    -- 境界線のスタイル
    border = "rounded",

    -- アイコン
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🔑",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },

  -- パフォーマンス
  performance = {
    rtp = {
      -- 無効化するプラグイン
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
