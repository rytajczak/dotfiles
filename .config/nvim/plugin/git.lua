require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "▎", change = "▎", delete = "▎" },
  },
})

require("mini.git").setup()

-- MiniDeps.add({
--   source = "NeogitOrg/neogit",
--   depends = {
--     "nvim-lua/plenary.nvim",
--     "sindrets/diffview.nvim",
--   },
-- })
--
-- require("neogit").setup({
--   kind = "replace",
--   graph_style = "kitty",
-- })
--
-- vim.keymap.set("n", "<leader>g", "<cmd>Neogit<cr>", { desc = "Open git client" })
