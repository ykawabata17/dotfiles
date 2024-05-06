return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntx highlighting
			modules = {},

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = true,

			-- List of parsers to ignore installing (or "all")
			ignore_install = {},

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotg plugin)
			autotag = {
				enable = true,
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"vimdoc",
				"ruby",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-J>",
					node_incremental = "<C-J>",
					scope_incremental = false,
					node_decremental = "<C-K>",
				},
			},
		})
	end,
}
