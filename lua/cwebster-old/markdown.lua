local M = {}
local g = vim.g

function M.markdown_setup()
  g.markdown_fenced_languages = {'javascript', 'python', 'clojure', 'ruby'}
  g.vim_markdown_fenced_languages = {'css', 'javascript', 'js=javascript', 'typescript',
    'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}
end

function M.mkdp_setup()
  -- g.mkdp_auto_close = 0
  -- g.mkdp_auto_open  = 1
  g.mkdp_filetypes  = { "markdown" }
end

return M
