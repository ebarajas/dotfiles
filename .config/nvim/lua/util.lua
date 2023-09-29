local M = {}
function M.find_root(path)
  path = path or vim.api.nvim_buf_get_name(0)
  return vim.fs.find({ "lua" }, { path = path, upward = true, type = "directory" })[1]
end

function M.is_nvim_config()
  local path = vim.loop.fs_realpath(vim.api.nvim_buf_get_name(0))
  if path then
    path = vim.fs.normalize(path)
    local config_root = vim.loop.fs_realpath(vim.fn.stdpath("config")) or vim.fn.stdpath("config")
    config_root = vim.fs.normalize(config_root)
    return path:find(config_root, 1, true) == 1
  end
  return false
end

return M
