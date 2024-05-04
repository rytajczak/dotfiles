return {
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsp_zero = require('lsp-zero')
      local conf = require('lspconfig')

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
    end,
  },
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
}
