local M = {}
local g = vim.g

function M.markdown_setup()
  g.markdown_fenced_languages = {'javascript', 'python', 'clojure', 'ruby'}
end

function M.mkdp_setup()
  g.mkdp_auto_close = 0
  g.mkdp_auto_open = 1
end

return M
