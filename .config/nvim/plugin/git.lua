MiniDeps.add({
  source = "NeogitOrg/neogit",
  depends = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
})

require("mini.git").setup()

require("neogit").setup()

vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { desc = "Open git client" })
