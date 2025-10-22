require("mini.animate").setup()

require("mini.bracketed").setup()
vim.keymap.set("n", "[q", ":cp<CR>")
vim.keymap.set("n", "]q", ":cn<CR>")

require("mini.clue").setup({
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "x", keys = "<leader>" },
    { mode = "n", keys = "z" },
  },
  window = { delay = 0 },
})

require("mini.completion").setup({
  window = {
    info = { border = "rounded" },
    signature = { border = "rounded" },
  },
  delay = { completion = 0, info = 0, signature = 0 },
})

vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>\<C-y>" : "\<Tab>"]], { expr = true })
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function() vim.g.minicompletion_disable = vim.bo.buftype ~= "" end,
})

require("mini.cursorword").setup()

require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "+", change = "~", delete = "-" },
  },
})

require("mini.extra").setup()

require("mini.files").setup()
vim.keymap.set("n", "<leader>e", function() MiniFiles.open() end, { desc = "Open file explorer" })
vim.keymap.set("n", "<leader>.", function() MiniFiles.open(vim.fn.stdpath("config")) end, { desc = "Edit config" })

require("mini.hipatterns").setup()

require("mini.icons").setup()

require("mini.pairs").setup()

local gen_loader = require("mini.snippets").gen_loader
require("mini.snippets").setup({
  snippets = {
    gen_loader.from_file("~/.config/nvim/snippets/global.json"),
    gen_loader.from_lang(),
  },
})

require("mini.statusline").setup()

require("mini.surround").setup()
