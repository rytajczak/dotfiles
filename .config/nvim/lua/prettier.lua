local M = {}

local supported = {
  "astro",
  "css",
  "graphql",
  "handlebars",
  "html",
  "javascript",
  "javascriptreact",
  "json",
  "jsonc",
  "less",
  "markdown",
  "markdown.mdx",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

function M.extend_filetypes(formatters_by_ft)
  for _, ft in ipairs(supported) do
    formatters_by_ft[ft] = { "prettierd", "prettier", stop_after_first = true }
  end
end

return M
