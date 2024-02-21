vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- Oil
keymap.set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Oil" })

-- Zen mode
keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
