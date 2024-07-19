return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<a-n>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<a-e>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<a-u>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<a-i>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
