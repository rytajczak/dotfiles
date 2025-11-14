MiniDeps.add({ source = "tpope/vim-sleuth" })
MiniDeps.add({ source = "stevearc/conform.nvim" })

local formatters_by_ft = {
  lua = { "stylua" },
}

require("prettier").extend_filetypes(formatters_by_ft)

require("conform").setup({
  formatters_by_ft = formatters_by_ft,
  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
