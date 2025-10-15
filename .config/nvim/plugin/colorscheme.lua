MiniDeps.now(function()
  MiniDeps.add({ source = "folke/tokyonight.nvim" })
  MiniDeps.add({ source = "vague2k/vague.nvim" })
end)

vim.api.nvim_create_autocmd("VimEnter", {
  nested = true,
  callback = function() pcall(vim.cmd.colorscheme, vim.g.SCHEME) end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(params) vim.g.SCHEME = params.match end,
})
