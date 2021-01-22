local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local a = vim.api
local map = require("utils").map
local augroup = require("utils").augroup

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

augroup("vista", function()
  -- automatically close vim if vista is the last window open
  vim.cmd [[ autocmd WinEnter * if &ft == 'vista' && winnr('$') == 1 | q | endif ]]
  vim.cmd [[ autocmd TabLeave * if &ft == 'vista' | wincmd w | endif ]]
end)

map('n', '<Leader>tb', ':Vista!!<CR>', {silent=true})
