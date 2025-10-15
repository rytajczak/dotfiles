vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.autoindent = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.o.conceallevel = 2
vim.o.confirm = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.list = true
vim.o.number = true
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>w", "<cmd>bd<CR>", { desc = "Delete buffer" })

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohl")
  vim.snippet.stop()
  return "<Esc>"
end)

if vim.g.neovide then
  vim.o.linespace = 20
  vim.g.neovide_scale_factor = 1.1
end

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/nvim-mini/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

vim.loader.enable()

require("mini.deps").setup({ path = { package = path_package } })
require("mini.notify").setup()
