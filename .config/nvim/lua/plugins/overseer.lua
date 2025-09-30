return {
  'stevearc/overseer.nvim',
  opts = {
    templates = { 'builtin' },
  },
  keys = {
    { '<leader>o', ':OverseerToggle<CR>', desc = 'Manage tasks' },
    { '<leader>m', ':OverseerBuild<CR>', desc = 'Build task' },
  },
}
