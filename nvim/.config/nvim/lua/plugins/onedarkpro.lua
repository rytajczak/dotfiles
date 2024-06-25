return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    init = function()
      require('onedarkpro').setup {
        options = {
          transparency = true,
        },
      }
      vim.cmd.colorscheme 'onedark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
