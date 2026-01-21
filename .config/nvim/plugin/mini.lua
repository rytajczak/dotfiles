require("mini.clue").setup({
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
    { mode = "n", keys = "z" },
  },
  window = { delay = 0 },
})

require("mini.completion").setup({
  window = {},
  delay = { completion = 0, info = 0, signature = 0 },
})
vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"]], { expr = true })
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.g.minicompletion_disable = vim.bo.buftype ~= "" end,
})

require("mini.cursorword").setup()

require("mini.extra").setup()

require("mini.files").setup({})
vim.keymap.set("n", "<leader>e", function()
  if MiniFiles.close() then return end
  MiniFiles.open()
end, { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.fn.stdpath("config")) end, { desc = "Edit neovim config" })

require("mini.icons").setup()

local pick = require("mini.pick")

local load_temp_rg = function(f)
  local rg_env = 'RIPGREP_CONFIG_PATH'
  local cached_rg_config = vim.uv.os_getenv(rg_env) or ''
  vim.uv.os_setenv(rg_env, vim.fn.stdpath('config') .. '/.rg')
  f()
  vim.uv.os_setenv(rg_env, cached_rg_config)
end

pick.registry.ff = function()
  load_temp_rg(function()
    pick.builtin.files({ tool = 'rg' })
  end)
end

pick.setup({
  window = {
    config = function()
      local height = math.floor(0.618 * vim.o.lines)
      local width = math.floor(0.618 * vim.o.columns)
      return {
        anchor = "NW",
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end,
  },
  mappings = {
    to_quickfix = {
      char = "<C-q>",
      func = function()
        local items = MiniPick.get_picker_items() or {}
        MiniPick.default_choose_marked(items)
        return true
      end,
    },
  },
})

vim.keymap.set("n", "<leader>f", "<cmd>Pick ff<cr>", { desc = "Open file picker" })
vim.keymap.set("n", "<leader>F", "<cmd>Pick buf_lines<cr>", { desc = "Open line picker" })
vim.keymap.set("n", "<leader>d", "<cmd>Pick diagnostic<cr>", { desc = "Open diagnostic picker" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Global search" })

require("mini.snippets").setup()

require("mini.statusline").setup()

require("mini.surround").setup()
