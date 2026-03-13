-- 検索/置換強化（grug-far）の設定

return {
	"MagicDuck/grug-far.nvim",
	cmd = "GrugFar",
	keys = {
		{
			"<leader>sr",
			function()
				require("grug-far").open()
			end,
			desc = "Search and Replace (GrugFar)",
		},
		{
			"<leader>sw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Search Current Word",
		},
		{
			"<leader>sw",
			mode = "v",
			function()
				require("grug-far").with_visual_selection()
			end,
			desc = "Search Selection",
		},
	},
	opts = {
		headerMaxWidth = 80,
	},
}
