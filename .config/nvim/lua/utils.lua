local M = {}

function M.find_buffer(filetype)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == filetype then return buf end
  end
  return nil
end

return M
