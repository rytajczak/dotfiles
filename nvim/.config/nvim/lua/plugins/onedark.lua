return {
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		opts = {
			transparent = true,
		},
		init = function()
			vim.cmd.colorscheme("onedark")
		end,
	},
}
