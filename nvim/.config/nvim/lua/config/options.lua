local o = vim.opt

vim.g.have_nerd_font = true;

-- Line numbers
o.number = true
o.relativenumber = true

-- Set indent
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
vim.bo.softtabstop = 2

-- Enable mouse
o.mouse = 'a'

-- o.showmode = false
o.clipboard = 'unnamedplus'
o.breakindent = true
o.undofile = true

-- Case insensitive searching
o.ignorecase = true
o.smartcase = true

o.signcolumn = 'yes'
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
o.inccommand = 'split'
o.cursorline = true
o.scrolloff = 10
