return {
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.pairs").setup()
			require("mini.comment").setup()
			require("mini.completion").setup({
				delay = { completion = 20, info = 100, signature = 50 },
			})
		end,
	},
}
