local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local a = vim.api
local map = require("utils").map
local augroup = require("utils").augroup

g.mapleader = ' '
g.maplocalleader = ','

-- set global, window and buffer options
require'_options'

-- some globals that need setting before plugins are loaded
g.python3_host_prog = os.getenv("HOME") .. '/miniconda3/bin/python3'
g.loaded_netrwPlugin = 1
g.polyglot_disabled = {'python', 'latex', 'typescript'} -- Use python-syntax and vimtex
g.jsx_ext_required = 0
g.markdown_fenced_languages = {'javascript', 'python', 'clojure', 'ruby'}

-- require plugins and stuff
require'plugins'.setup()
require'lsp'.setup()
require'nvimtree'.setup()
require'_vista'
require'_theme'
require'plugin_config'

a.nvim_exec([[
  if has ("autocmd")
    filetype plugin indent on
  endif

  " Persistent undo (can use undos after exiting and restarting)
  if exists("+undofile")
    if isdirectory($HOME . '/.vim/undo') == 0
      :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo// undodir+=~/.vim/undo// undofile
  endif
]], '')

if vim.fn.has('conceal') == 1 then
  o.conceallevel = 2
  o.concealcursor = "niv"
end

if vim.fn.has('persistent_undo') == 1 then
  o.undofile = true
  o.undolevels = 250
  o.undoreload = 500
end

augroup("vimrc-main", function()
  -- save when focus lost
  vim.cmd [[ autocmd FocusLost * silent! wa ]]
  vim.cmd [[ autocmd StdinReadPre * let s:std_in=1 ]]
  -- strip trailing whitespace
  -- vim.cmd [[ autocmd BufWritePre * :%s/\s\+$//e ]]
  -- starphleet
  vim.cmd [[ au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh ]]
  -- tab management
  vim.cmd [[ au TabLeave * let g:lasttab = tabpagenr() ]]
  -- highlight yanks
  vim.cmd [[ au TextYankPost * silent! lua vim.highlight.on_yank { higroup='Visual', timeout=200 } ]]
  vim.cmd [[ au FileType markdown setlocal spell]]
end)

augroup("numbertoggle", function()
   vim.cmd("autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif")
   vim.cmd("autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif")
end)

--mappings
require'_mappings'

-- we are done setting stuff up
a.nvim_command("silent! helptags ALL")
