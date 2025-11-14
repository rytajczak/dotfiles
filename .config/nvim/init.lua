vim.g.mapleader = " "

vim.o.autoindent = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.o.cmdheight = 0
vim.o.confirm = true
vim.o.foldlevel = 99
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.list = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmode = false
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.statuscolumn = "%s%l %C  "
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohl")
  return "<Esc>"
end)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/nvim-mini/mini.nvim", mini_path }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })
require("mini.notify").setup({ lsp_progress = { enable = false } })
