return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavor = "mocha",
			transparent_background = true,
		},
		init = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
