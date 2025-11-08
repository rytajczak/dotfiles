MiniDeps.add({ source = "vague-theme/vague.nvim" })

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function() pcall(vim.cmd.colorscheme, vim.g.SCHEME) end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(params) vim.g.SCHEME = params.match end,
})
