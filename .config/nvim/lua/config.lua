-- Options
local o = vim.opt

vim.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.splitright = true
o.splitbelow = true

o.title = true
o.autoindent = true
o.smartindent = true
o.hlsearch = true
o.backup = false
o.cmdheight = 0
o.scrolloff = 10

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Keymaps
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all in buffer' })

vim.keymap.set('n', '<A-n>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<A-i>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<A-e>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<A-u>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', 'ss', ':split<CR>', { desc = 'Split' })
vim.keymap.set('n', 'sv', ':vsplit<CR>', { desc = 'Split vertical' })

-- Autocommands
vim.api.nvim_create_autocmd('VimResized', {
  command = 'wincmd =',
})

vim.api.nvim_create_autocmd('InsertEnter', {
  pattern = '*',
  command = 'setlocal guicursor+=i:ver25-blinkon100',
})
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'setlocal guicursor-=i:ver25-blinkon0',
})

vim.api.nvim_create_augroup('TerminalLineNumbers', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', {
  group = 'TerminalLineNumbers',
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd('TermClose', {
  group = 'TerminalLineNumbers',
  pattern = '*',
  callback = function()
    vim.opt_local.number = true
    vim.opt_local.relativenumber = true
  end,
})
