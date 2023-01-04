local M = {}
local g = vim.g

function M.setup()
  g.better_whitespace_ctermcolor='red'
  g.better_whitespace_guicolor='red'
  g.better_whitespace_enabled=1
  g.strip_whitespace_on_save=1
  g.strip_whitespace_confirm=0
  g.better_whitespace_operator='_s'
end

return M
