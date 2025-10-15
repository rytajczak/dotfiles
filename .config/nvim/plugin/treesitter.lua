MiniDeps.add({
  source = "nvim-treesitter/nvim-treesitter",
  checkout = "main",
  hooks = {
    post_checkout = function() vim.cmd("TSUpdate") end,
  },
})

require("nvim-treesitter").install({
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  callback = function()
    pcall(vim.treesitter.start)
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

MiniDeps.add({ source = "windwp/nvim-ts-autotag" })

require("nvim-ts-autotag").setup()
