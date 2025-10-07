require("config.options")
require("config.keymaps")

local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/nvim-mini/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end
require("mini.deps").setup({ path = { package = path_package } })

vim.loader.enable()

local add = MiniDeps.add

add({ source = "vague2k/vague.nvim" })
vim.cmd([[colorscheme vague]])

add({ source = "tpope/vim-sleuth" })
add({ source = "tpope/vim-fugitive" })
add({
  source = "neovim/nvim-lspconfig",
  depends = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
})
add({ source = "folke/lazydev.nvim" })
add({ source = "stevearc/conform.nvim" })
