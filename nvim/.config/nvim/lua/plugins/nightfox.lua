return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
    init = function()
      vim.cmd.colorscheme 'carbonfox'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
