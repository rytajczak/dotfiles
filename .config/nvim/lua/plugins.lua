local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  'tpope/vim-sleuth',
  { -- QoL
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.statusline').setup()
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    config = true
  },
  { -- Syntax Hightlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'latex' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  { -- File Manager
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        view_options = { show_hidden = true }
      }
      vim.keymap.set('n', '<leader>e', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  { -- Fuzzy Finder
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by grep' })
      vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Find buffers' })
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search nvim config files' })
    end,
  },
  { -- Task Manager
    'stevearc/overseer.nvim',
    dependencies = {
      { 'stevearc/dressing.nvim', opts = {} },
      'rcarriga/nvim-notify'
    },
    config = function()
      require('overseer').setup {
        task_list = { direction = 'right' },
      }
      vim.notify = require("notify")

      vim.api.nvim_create_user_command('OverseerRestartLast', function()
        local overseer = require 'overseer'
        local tasks = overseer.list_tasks { recent_first = true }
        if vim.tbl_isempty(tasks) then
          vim.notify('No tasks found', vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], 'restart')
        end
      end, {})

      vim.keymap.set('n', '<leader>tt', '<CMD>OverseerToggle<CR>', { desc = 'Toggle overseer' })
      vim.keymap.set('n', '<leader>tr', '<CMD>OverseerRun<CR>', { desc = 'Run a task' })
      vim.keymap.set('n', '<leader>tb', '<CMD>OverseerBuild<CR>', { desc = 'Build a task' })
      vim.keymap.set('n', '<leader>ts', '<CMD>OverseerSaveBundle<CR>', { desc = 'Save bundle' })
      vim.keymap.set('n', '<leader>tl', '<CMD>OverseerLoadBundle<CR>', { desc = 'Load bundle' })
      vim.keymap.set('n', '<leader>tR', '<CMD>OverseerRestartLast<CR>', { desc = 'Restart last task' })
    end,
  },
  { -- You know Neovim is shit when you install a plugin to help write config
    'folke/lazydev.nvim',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  { -- LSP Config
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },
      { 'saghen/blink.cmp' }
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LspGroup', { clear = true }),
        callback = function()
          local builtin = require 'telescope.builtin'
          vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Goto definition' })
          vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Goto reference' })
          vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { desc = 'Goto reference' })
          vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { desc = 'Goto reference' })
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('mason-lspconfig').setup {
        ensure_installed = { 'lua_ls' },
        automatic_installation = true,
        handlers = {
          function(server)
            require('lspconfig')[server].setup { capabilities = capabilities }
          end,
        },
      }
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'super-tab' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      signature = { enabled = true }
    },
    opts_extend = { "sources.default" }
  },
  { -- Formatting
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      },
      format_on_save = {
        lsp_format = 'fallback',
        timeout_ms = 500,
      },
    },
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      latex = { enable = true }
    }
  },
  {
    'jubnzv/mdeval.nvim',
    config = function()
      require('mdeval').setup({
        require_confirmation = false
      })
      vim.keymap.set('n', '<leader>c', "<cmd>lua require 'mdeval'.eval_code_block()<CR>")
    end
  },
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'vscode'
    end,
  },
}
