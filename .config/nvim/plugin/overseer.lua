MiniDeps.add({ source = "stevearc/overseer.nvim", checkout = "v1.6.0" })

require("overseer").setup()

vim.keymap.set("n", "<leader>r", ":OverseerRun<CR>")
vim.keymap.set("n", "<leader>o", ":OverseerToggle<CR>")
