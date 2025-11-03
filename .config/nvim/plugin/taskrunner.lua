MiniDeps.add({ source = "stevearc/overseer.nvim", checkout = "v1.6.0" })

require("overseer").setup()

vim.keymap.set("n", "<leader>t", ":OverseerToggle<CR>", { desc = "View tasks" })
vim.keymap.set("n", "<leader>r", function()
  local buf = require("utils").find_buffer("OverseerForm")
  if buf then
    vim.cmd("bd! " .. buf)
  else
    vim.cmd("OverseerRun")
  end
end, { desc = "Run task" })
