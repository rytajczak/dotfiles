MiniDeps.add({ source = "tpope/vim-fugitive" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false

    vim.keymap.set("n", "S", ":Git add .<CR>", {
      buffer = true,
      desc = "Stage all files",
    })
    vim.keymap.set("n", "q", ":bd<CR>", { buffer = true })
  end,
})

vim.keymap.set("n", "<leader>g", ":Git<CR>", { desc = "Open git client" })
