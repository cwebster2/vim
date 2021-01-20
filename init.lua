local o = vim.o
local wo = vim.wo
local g = vim.g
local a = vim.api

g.mapleader = ' '
g.maplocalleader = ','

o.updatetime = 300
o.foldlevelstart = 99
o.termguicolors = true
o.ignorecase = true
o.confirm = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.scrolloff = 5
o.incsearch = true
o.splitright = true
o.splitbelow = true
o.wildmenu = true
o.wildmode = 'full'
o.hlsearch = true
o.showmode = false
o.showmatch = true
o.inccommand = 'split'
o.shortmess = vim.o.shortmess .. 'c'
o.smartindent = true
o.textwidth = 80
o.formatoptions = o.formatoptions:gsub('[cro]','')
o.colorcolumn = '100'
o.completeopt = "menuone,noinsert,noselect"
o.linebreak = true
o.foldmethod='expr'
o.foldexpr='nvim_treesitter#foldexpr()'
wo.number = true
wo.cursorline = true

g.python3_host_prog = os.getenv("HOME") .. '/miniconda3/bin/python3'
g.loaded_netrwPlugin = 1
g.polyglot_disabled = {'python', 'latex', 'typescript'} -- Use python-syntax and vimtex
g.jsx_ext_required = 0
g.markdown_fenced_languages = {'javascript', 'python', 'clojure', 'ruby'}

-- require plugins and stuff
require'plugins'
require'lsp'.setup()

g.jellybeans_overrides = {
  background = {
    ctermbg = 'none',
    ["256ctermbg"] = 'none',
  },
  VertSplit = {
    ctermbg = 'none',
    guibg = 'none',
    ["256ctermbg"] = 'none',
  },
}
g.jellybeans_use_term_italics = 1

a.nvim_exec([[

  if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
  endif
  colorscheme jellybeans

  if has ("autocmd")
    filetype plugin indent on
  endif

  set clipboard^=unnamedplus,unnamed " Make "yanks"

  " Persistent undo (can use undos after exiting and restarting)
  if exists("+undofile")
    if isdirectory($HOME . '/.vim/undo') == 0
      :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=./.vim-undo// undodir+=~/.vim/undo// undofile
  endif

  if has('persistent_undo')
    set undofile       " So is persistent undo ...
    set undolevels=250 " Maximum number of changes that can be undone
    set undoreload=500 " Maximum number lines to save for undo on a buffer reload
  endif

  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END

]], '')
