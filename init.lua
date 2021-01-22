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

-- config

--quick-scope
g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

g.fzf_command_prefix = 'F'

g.DevIconsEnableFoldersOpenClose = 1

g.gitgutter_map_keys = 0
g.gitgutter_override_sign_column_highlight = 0
g.gitgutter_sign_added = "▎"
g.gitgutter_sign_modified = "▎"
g.gitgutter_sign_removed = "▏"
g.gitgutter_sign_removed_above_and_below = "▔"
g.gitgutter_sign_removed_first_line = "_"
g.gitgutter_sign_modified_removed = "▋"

g.indentLine_char = '▏'
g.indentLine_color_gui = '#222222'

g.pear_tree_repeatable_expand = 0

g.better_whitespace_ctermcolor='red'
g.better_whitespace_guicolor='red'
g.better_whitespace_enabled=1
g.strip_whitespace_on_save=1
g.strip_whitespace_confirm=0

g.vim_markdown_folding_disabled = 1
g.vim_markdown_conceal = 0
g.tex_conceal = ""
g.vim_markdown_math = 1

g.vim_markdown_fenced_languages = {'css', 'javascript', 'js=javascript', 'typescript',
    'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}

g.mkdp_auto_close = 0

g.tex_flavor='latex'
g.Tex_DefaultTargetFormat='pdf'
g.Tex_CompileRule_pdf='pdflatex --interaction=nonstopmode $*'

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

--color stuff
--mappings



-- visual mode indent keep selection
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})
map('v', '.', ':normal .<CR>', {noremap=true})

-- fugitive
map('n', '<Leader>gw', ':Gwrite<CR>', {silent=true})
map('n', '<Leader>gs', ':Gstatus<CR>', {silent=true})
map('n', '<Leader>gc', ':Gcommit<CR>', {silent=true})
map('n', '<Leader>gp', ':Gpush<CR>', {silent=true})

-- move between splits
map('n', '<C-m>', '<C-w><C-h>', {noremap=true})
map('n', '<C-n>', '<C-w><C-j>', {noremap=true})
map('n', '<C-e>', '<C-w><C-k>', {noremap=true})
map('n', '<C-i>', '<C-w><C-l>', {noremap=true})

-- visual line movement
map('', 'j', '(v:count == 0 ? \'gj\' : \'j\')', {expr=true,noremap=true,silent=true})
map('', '<Down>', '(v:count == 0 ? \'gj\' : \'<Down>\')', {expr=true,noremap=true,silent=true})
map('', 'k', '(v:count == 0 ? \'gk\' : \'k\')', {expr=true,noremap=true,silent=true})
map('', '<Up>', '(v:count == 0 ? \'gk\' : \'<Up>\')', {expr=true,noremap=true,silent=true})

-- quick spilt
map('n', '<Leader>v', '<C-w>v<C-w>w', {})

-- clear search
map('n', '<Leader>/', ':let @/=""<CR>', {silent=true})

-- spell
map ('n', '<F9>', ':set spell!<cr>', {silent=true})
map ('i', '<F9>', '<C-O>:set spell!<cr>', {silent=true})
