local g = vim.g
local a = vim.api
local augroup = require("utils").augroup

local M = {}

M.setup = function()
  g.vista_icon_indent = {"╰─▸ ", "├─▸ "}
  g.vista_default_executive = 'nvim_lsp'
  g.vista_fzf_preview = {'right:50%'}

  a.nvim_exec([[
    let g:vista#renderer#enable_icon = 1
  "   let g:vista#renderer#icons = {
  "       \ "function": "\uf794",
  "       \ "variable": "\uf71b",
  "       \  }
  ]],'')

  augroup("vista", {
    -- automatically close vim if vista is the last window open
    {'WinEnter', '*', 'if &ft == "vista" && winnr("$") == 1 | q | endif'},
    {'TabLeave', '*', 'if &ft == "vista" | wincmd w | endif'},
  })
end

return M
