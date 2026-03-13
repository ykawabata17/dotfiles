-- nvim-notify: 通知表示（noice.nvim から利用）

return {
	"rcarriga/nvim-notify",
	opts = {
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		render = "minimal",
		stages = "fade_in_slide_out",
	},
}
