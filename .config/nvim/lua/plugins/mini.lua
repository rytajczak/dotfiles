return {
  {
    'nvim-mini/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.clue').setup({
        triggers = {
          { mode = 'n', keys = '<leader>' },
          { mode = 'x', keys = '<leader>' },
        },
        window = { delay = 0 },
      })
      require('mini.extra').setup()
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.notify').setup()
      require('mini.pairs').setup({
        modes = { insert = true, command = true, terminal = false },
        skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        skip_ts = { 'string' },
        skip_unbalanced = true,
        markdown = true,
      })
      require('mini.pick').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
    end,
    keys = {
      { '<leader>f', function() MiniPick.builtin.files() end, desc = 'Open file picker' },
      { '<leader>e', function() MiniFiles.open() end, desc = 'Open file explorer' },
    },
  },
}
