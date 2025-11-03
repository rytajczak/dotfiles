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
      severity_sort = true,
      virtual_text = {
        spacing = 4,
        source = "if_many",
      },
    })
  end,
})

require("mason").setup()
require("mason-lspconfig").setup()
