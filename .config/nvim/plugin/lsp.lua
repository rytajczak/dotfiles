require("mason").setup()

require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Peform code action" })
  end,
})
