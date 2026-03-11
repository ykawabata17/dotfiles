-- nvim-lint: リアルタイム Linter
return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- 言語ごとの Linter 設定
		lint.linters_by_ft = {
			-- Ruby
			ruby = { "rubocop" },

			-- JavaScript/TypeScript
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			-- その他
			markdown = { "markdownlint" },
			yaml = { "yamllint" },
		}

		-- Rubocop の設定（Docker 環境用にカスタマイズ可能）
		-- lint.linters.rubocop.cmd = "bundle"
		-- lint.linters.rubocop.args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin" }

		-- 自動実行の設定
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- 手動で Lint を実行するキーマップ
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger Linting" })
	end,
}
