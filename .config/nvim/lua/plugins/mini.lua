return {
  'tpope/vim-sleuth',
  {
    'nvim-mini/mini.nvim',
    version = false,
    event = 'VeryLazy',
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
      require('mini.extra').setup()
      require('mini.files').setup()
      require('mini.icons').setup()
      require('mini.notify').setup()

      local pick = require('mini.pick')

      local load_temp_rg = function(f)
        local rg_env = 'RIPGREP_CONFIG_PATH'
        local cached_rg_config = vim.uv.os_getenv(rg_env) or ''
        vim.uv.os_setenv(rg_env, vim.fn.stdpath('config') .. '/.rg')
        print(vim.fn.stdpath('config'))
        f()
        vim.uv.os_setenv(rg_env, cached_rg_config)
      end

      pick.registry.files = function()
        load_temp_rg(function() pick.builtin.files({ tool = 'rg' }) end)
      end

      require('mini.pick').setup()
      require('mini.snippets').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
    end,
    keys = {
      { '<leader>f', function() MiniPick.registry.files() end, desc = 'Open file picker' },
      { '<leader>/', function() MiniPick.builtin.grep_live() end, desc = 'Global search' },
      { '<leader>e', function() MiniFiles.open() end, desc = 'Open file explorer' },
    },
  },
}
