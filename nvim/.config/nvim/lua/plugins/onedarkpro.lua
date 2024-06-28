return {
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    opts = {
      options = {
        transparency = true,
      },
    },
    init = function()
      vim.cmd.colorscheme 'onedark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
