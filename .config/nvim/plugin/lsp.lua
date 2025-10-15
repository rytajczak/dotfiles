MiniDeps.add({
  source = "neovim/nvim-lspconfig",
  depends = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
    vim.diagnostic.config({
      underline = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
      },
      severity_sort = true,
    })
  end,
})

require("mason").setup()
require("mason-lspconfig").setup()

vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Manage LSP servers" })

MiniDeps.add({ source = "folke/lazydev.nvim" })

local package_path = vim.fn.stdpath("data") .. "/site/pack/deps"
require("lazydev").setup({
  library = {
    vim.env.VIMRUNTIME,
    package_path .. "/start/mini.nvim",
    package_path .. "/opt/snacks.nvim",
  },
})
