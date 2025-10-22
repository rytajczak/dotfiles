local package_path = vim.fn.stdpath("data") .. "/site/pack/deps"

return {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      diagnostics = { workspaceDelay = -1 },
      workspace = {
        ignoreSubmodules = true,
        library = {
          vim.env.VIMRUNTIME,
          package_path .. "/start/mini.nvim",
        },
      },
      telemetry = { enable = false },
    },
  },
}
