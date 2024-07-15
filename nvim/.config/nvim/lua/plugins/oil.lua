return {
	{
		"stevearc/oil.nvim",
		opts = {
			vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>"),
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
