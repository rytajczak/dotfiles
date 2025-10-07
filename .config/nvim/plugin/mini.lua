require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open file explorer" })

local pick = require("mini.pick")

local function with_ripgreprc(f)
  local rg_env = "RIPGREP_CONFIG_PATH"
  local cached_rg_config = vim.uv.os_getenv(rg_env) or ""
  vim.uv.os_setenv(rg_env, vim.fn.stdpath("config") .. "/.ripgreprc")
  f()
  vim.uv.os_setenv(rg_env, cached_rg_config)
end

pick.registry.better_files = function()
  with_ripgreprc(function() pick.builtin.files() end)
end

require("mini.pick").setup()
vim.keymap.set("n", "<leader>f", function() MiniPick.registry.better_files() end, { desc = "Open file picker" })

require("mini.ai").setup()
require("mini.clue").setup({
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
  },
  window = { delay = 0 },
})
require("mini.completion").setup({ delay = { completion = 0, info = 0, signature = 0 } })
require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "+", change = "~", delete = "-" },
  },
  delay = { text_change = 0 },
})
require("mini.icons").setup()
require("mini.indentscope").setup({ symbol = "│" })
require("mini.notify").setup()
require("mini.pairs").setup()
require("mini.statusline").setup()
require("mini.surround").setup()
