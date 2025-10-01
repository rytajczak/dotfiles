return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    opts = {},
    keys = {
      { '<leader>gg', ':Neogit kind=floating<CR>', desc = 'Open neogit' },
      { '<leader>gd', ':Neogit diff<CR>', desc = 'Open diff view' },
      { '<leader>gb', ':Neogit branch<CR>', desc = 'Open branch view' },
    },
  },
}
