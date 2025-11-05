MiniDeps.add({ source = "stevearc/overseer.nvim", checkout = "v1.6.0" })

require("overseer").setup()

vim.keymap.set("n", "<leader>t", "<cmd>OverseerToggle<CR>", { desc = "View tasks" })
vim.keymap.set("n", "<leader>r", "<cmd>OverseerRun<CR>", { desc = "Run task" })
