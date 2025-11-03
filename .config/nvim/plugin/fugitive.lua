MiniDeps.add({ source = "tpope/vim-fugitive" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false
    vim.o.statuscolumn = ""

    vim.keymap.set("n", "S", ":Git add .<CR>", {
      buffer = true,
      desc = "Stage all files",
    })
  end,
})

vim.keymap.set("n", "<leader>g", function()
  local buf = require("utils").find_buffer("fugitive")
  if buf then
    vim.cmd("bd " .. buf)
  else
    vim.cmd("Git")
  end
end, { desc = "Open git client" })
