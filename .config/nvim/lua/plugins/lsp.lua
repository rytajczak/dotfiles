return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function()
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references)
          vim.keymap.set('n', 'gI', vim.lsp.buf.implementation)
          vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover)
          vim.keymap.set('n', 'gK', vim.lsp.buf.signature_help)
          vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help)
          vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { desc = 'Perform code action' })
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol' })
        end,
      })

      vim.diagnostic.config({
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      })

      require('mason-lspconfig').setup({ ensure_installed = { 'lua_ls', 'ts_ls' } })
    end,
  },
  {
    'folke/lazydev.nvim',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
