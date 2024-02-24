local k = vim.keymap

vim.g.mapleader = " "

-- The good $hit (stuff that should be default)
k.set("n", "x", '"_x')

k.set("v", "e", ":m '>+1<CR>gv=gv")
k.set("v", "u", ":m '<-2<CR>gv=gv")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")

-- Lazygit
k.set("n", "<leader>gg", "", { desc = "Toggle Lazygit" })

-- Oil
k.set("n", "<leader>e", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Toggle Oil" })

-- Zen mode
k.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
