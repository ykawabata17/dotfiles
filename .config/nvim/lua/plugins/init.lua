-- プラグイン管理設定
-- lazy.nvim を使用してプラグインを管理します

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの設定
require("lazy").setup({
	-- ============================================================================
	-- 共通依存関係
	-- ============================================================================
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({ default = true })
		end,
	},

	-- ============================================================================
	-- 基本プラグイン（個別ファイル不要なもの）
	-- ============================================================================
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup()
			vim.keymap.set("n", "<C-/>", function()
				require("Comment.api").toggle.linewise.current()
			end, { desc = "Toggle comment" })
			vim.keymap.set("x", "<C-/>", function()
				local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
				vim.api.nvim_feedkeys(esc, "nx", false)
				require("Comment.api").toggle.linewise(vim.fn.visualmode())
			end, { desc = "Toggle comment for selection" })
		end,
	},

	{ "github/copilot.vim", event = "InsertEnter" },

	-- ============================================================================
	-- Git 関連
	-- ============================================================================
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = { current_line_blame = true },
	},
	{ "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewClose" } },
	{
		"kdheepak/lazygit.nvim",
		keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
	},

	-- ============================================================================
	-- Ruby/Rails 関連
	-- ============================================================================
	{ "tpope/vim-rails", ft = { "ruby", "eruby" } },
	{ "slim-template/vim-slim", ft = "slim" },
	{ "tpope/vim-endwise", ft = { "ruby", "eruby", "lua" } },
	{
		"mogulla3/rspec.nvim",
		ft = "ruby",
		opts = { open_quickfix_when_spec_failed = true },
	},

	-- ============================================================================
	-- カテゴリ別プラグイン設定（サブディレクトリからインポート）
	-- ============================================================================

	-- UI: テーマ、ステータスライン、通知など
	{ import = "plugins.ui" },

	-- Editor: ファイル操作、移動、検索など
	{ import = "plugins.editor" },

	-- LSP: 補完、診断、フォーマットなど
	{ import = "plugins.lsp" },

	-- Lang: 言語固有の設定（Treesitter、テストなど）
	{ import = "plugins.lang" },

	-- Tools: ターミナル、セッション管理など
	{ import = "plugins.tools" },

	-- ============================================================================
	-- Lazy.nvim 設定
	-- ============================================================================
}, {
	install = {
		colorscheme = { "catppuccin" },
	},
	ui = {
		border = "rounded",
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
	performance = {
		rtp = {
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
