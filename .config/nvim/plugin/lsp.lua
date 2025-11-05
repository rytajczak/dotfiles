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

local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_plugin_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "vue" },
})
