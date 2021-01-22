local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g
local a = vim.api
local map = require("utils").map
local augroup = require("utils").augroup

g.mapleader = ' '
g.maplocalleader = ','

o.shell = "/bin/bash"
o.updatetime = 300
o.foldlevelstart = 99
o.termguicolors = true
o.ignorecase = true
o.confirm = true
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
o.matchtime = 5
o.inccommand = 'split'
o.shortmess = vim.o.shortmess .. 'c'
o.textwidth = 80
o.formatoptions = o.formatoptions:gsub('[cro]','')
o.colorcolumn = '100'
o.completeopt = "menuone,noinsert,noselect"
o.clipboard = "unnamedplus,unnamed"
o.linebreak = true
o.foldmethod='expr'
o.foldexpr='nvim_treesitter#foldexpr()'
o.cmdheight = 2
o.hidden = true
o.backspace = "indent,eol,start"
o.backup = false
o.diffopt = "filler,internal,algorithm:histogram,indent-heuristic"
o.lazyredraw = true
o.pastetoggle = "<F11>"
o.previewheight = 25
o.ttimeoutlen = 50
o.viewoptions = "cursor,folds,options,unix,slash"
o.virtualedit = "onemore"
o.writebackup = false

bo.autoindent = false
bo.autoread = true
bo.tabstop = 2
bo.shiftwidth = 2
bo.softtabstop = 2
bo.expandtab = true
bo.smartindent = true

wo.signcolumn = "yes"
wo.number = true
wo.cursorline = true
wo.fillchars = "vert:|"
wo.list = true
wo.listchars = "tab:▷\\ ,trail:·,extends:◣,precedes:◢,nbsp:○"

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

]], '')

augroup("vimrc-main", function()
  -- save when focus lost
  vim.cmd("autocmd FocusLost * silent! wa")
  vim.cmd("autocmd StdinReadPre * let s:std_in=1")
  -- strip trailing whitespace
  vim.cmd("autocmd BufWritePre * :%s/\\s+$//e")
  -- starphleet
  vim.cmd("au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh")
  -- tab management
  vim.cmd("au TabLeave * let g:lasttab = tabpagenr()")
end)

augroup("numbertoggle", function()
   vim.cmd("autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif")
   vim.cmd("autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif")
end)

--color stuff
vim.api.nvim_command [[ hi PMenu ctermbg=Black guibg=#191919 ]]
vim.api.nvim_command [[ hi PMenuSel guifg=#ffffff guibg=#333333 ]]
vim.api.nvim_command [[ highlight clear SignColumn ]]
vim.api.nvim_command [[ highlight GitGutterAdd ctermbg=NONE ctermfg=green guibg=NONE guifg=green ]]
vim.api.nvim_command [[ highlight GitGutterChange ctermbg=NONE ctermfg=green guibg=NONE guifg=#2B5B77 ]]
vim.api.nvim_command [[ highlight GitGutterDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=red ]]
vim.api.nvim_command [[ highlight GitGutterChangeDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=#2B5B77 ]]

--mappings

-- tab for completion
map('i', '<Tab>', "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", {expr=true, noremap=true})
map('i', '<S-Tab>', "pumvisible() ? \"\\<C-p>\" : \"\\<S-Tab>\"", {expr=true, noremap=true})

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


