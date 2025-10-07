require("mason").setup()
vim.keymap.set("n", "<leader>m", ":Mason<CR>", { desc = "Manage LSP servers" })

require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto implementation" })
    vim.keymap.set("n", "gy", vim.lsp.buf.definition, { desc = "Goto type definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.definition, { desc = "Goto declaration" })
    vim.keymap.set("n", "K", function() return vim.lsp.buf.hover() end, { desc = "Hover" })
    vim.keymap.set("n", "gK", function() return vim.lsp.buf.signature_help() end, { desc = "Signature help" })
    vim.keymap.set("n", "<c-k>", function() return vim.lsp.buf.signature_help() end, { desc = "Signature help" })
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Peform code action" })
  end,
})
