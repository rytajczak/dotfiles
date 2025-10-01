return {
  'tpope/vim-sleuth',
  {
    'nvim-mini/mini.nvim',
    version = false,
    lazy = false,
    config = function()
      require('mini.pairs').setup()
      require('mini.clue').setup({
        triggers = {
          { mode = 'n', keys = '<leader>' },
          { mode = 'x', keys = '<leader>' },
        },
        window = { delay = 0 },
      })
      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '+', change = '~', delete = '-' },
        },
      })
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.notify').setup()
      require('mini.pick').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
      require('mini.extra').setup()
    end,
    keys = {
      { '<leader>e', function() MiniFiles.open() end, desc = 'Open file explorer' },
      { '<leader>f', function() MiniPick.builtin.files() end, desc = 'Open file picker' },
    },
  },
}
