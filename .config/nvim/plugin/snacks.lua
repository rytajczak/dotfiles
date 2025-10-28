MiniDeps.add({ source = "folke/snacks.nvim" })

require("snacks").setup({
  picker = {
    layout = { preset = "select" },
    matcher = { frecency = true },
    win = {
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
        },
      },
    },
  },
})

vim.keymap.set("n", "<leader>f", Snacks.picker.files, { desc = "Open file picker" })
vim.keymap.set("n", "<leader>b", Snacks.picker.buffers, { desc = "Open buffer picker" })
vim.keymap.set("n", "<leader>/", Snacks.picker.grep, { desc = "Global search" })
vim.keymap.set("n", "<leader>d", Snacks.picker.diagnostics, { desc = "Open diagnostic picker" })
