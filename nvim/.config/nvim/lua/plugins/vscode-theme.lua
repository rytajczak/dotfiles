return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    init = function()
      require('vscode').setup { transparent = true }
      vim.cmd.colorscheme 'vscode'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
