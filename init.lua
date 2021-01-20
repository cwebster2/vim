local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local a = vim.api

g.mapleader = ' '
g.maplocalleader = ','

o.shell = "/bin/bash"
o.updatetime = 300
o.foldlevelstart = 99
o.termguicolors = true
o.ignorecase = true
o.confirm = true
bo.tabstop = 2
bo.shiftwidth = 2
bo.softtabstop = 2
bo.expandtab = true
o.scrolloff = 5
o.shiftround = true
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
o.cmdheight = 2
wo.signcolumn = "yes"
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

-- config

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


a.nvim_exec([[

  if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
  endif
  colorscheme jellybeans

  if has ("autocmd")
    filetype plugin indent on
  endif

  set clipboard^=unnamedplus,unnamed " Make "yanks"
  set list listchars=tab:▷\ ,trail:·,extends:◣,precedes:◢,nbsp:○
  set backspace=indent,eol,start

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

augroup vimrc-main
  autocmd!
  "save when window loses focus
  autocmd FocusLost * silent! wa
  autocmd StdinReadPre * let s:std_in=1

  "strip trailing whitespace
  autocmd BufWritePre * :%s/\s+$//e

  " starphleet specific
  au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh

  " For tab management
  au TabLeave * let g:lasttab = tabpagenr()
augroup END

highlight clear SignColumn
highlight GitGutterAdd ctermbg=NONE ctermfg=green guibg=NONE guifg=green
highlight GitGutterChange ctermbg=NONE ctermfg=green guibg=NONE guifg=#2B5B77
highlight GitGutterDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=red
highlight GitGutterChangeDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=#2B5B77
]], '')

--color stuff

--mappings
function map(mode, key, to, opts)
  a.nvim_set_keymap(mode, key, to, opts or {})
end

map('i', '<Tab>', "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", {expr=true, noremap=true})
map('i', '<S-Tab>', "pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"", {expr=true, noremap=true})

