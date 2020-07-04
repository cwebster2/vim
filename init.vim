map <Space> <Leader>
set shell=/bin/bash
set nocompatible

let g:python3_host_prog = $HOME . '/miniconda3/bin/python3'

"plugins

if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing Vim-Plug\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'  " syntax files for most languages
Plug 'vim-python/python-syntax'  " Improved python syntax
Plug 'Vimjas/vim-python-pep8-indent'  " Proper python indenting
Plug 'chrisbra/Colorizer'  " Highlight CSS colors
Plug 'vim-latex/vim-latex'
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"Plug 'jaxbot/github-issues.vim'
Plug 'junegunn/gv.vim'
Plug 'tmsvg/pear-tree'
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'
if has('nvim')
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"set mouse=a
filetype plugin indent on
let fortran_free_source=1
set noautoindent
set autoread
set shortmess=aoOtTc
set viewoptions=cursor,folds,options,unix,slash
set virtualedit=onemore
set lazyredraw
set encoding=utf-8
set previewheight=25
set clipboard^=unnamedplus,unnamed " Make "yanks"
set textwidth=0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
set expandtab
set number
set scrolloff=5
set hlsearch
set incsearch
set showmatch
set matchtime=5
set laststatus=2
set ttimeoutlen=50
set noshowmode
set nobackup
set splitright
set splitbelow
set completeopt=menu,menuone,noselect,noinsert
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
set termguicolors
syntax on
set cursorline
set pastetoggle=<F11>
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest,full
set list listchars=tab:▷\ ,trail:·,extends:◣,precedes:◢,nbsp:○
set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set signcolumn=yes
set inccommand=split

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

" Colors

let g:jellybeans_overrides = {
  \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
colorscheme jellybeans

"devicons
let g:DevIconsEnableFoldersOpenClose = 1

"vim-fugitive
nmap <silent><Leader>gw :Gwrite<CR>
nmap <silent><Leader>gs :Gstatus<CR>
nmap <silent><Leader>gc :Gcommit<CR>

"vim-gitgutter
let g:gitgutter_map_keys = 0
set updatetime=200 " faster updates
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermbg=NONE ctermfg=green guibg=NONE guifg=green
highlight GitGutterChange ctermbg=NONE ctermfg=green guibg=NONE guifg=#2B5B77
highlight GitGutterDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=red
highlight GitGutterChangeDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=#2B5B77

"indentline
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#222222'

" netrw config, can we work without NERDtree?
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

"peartree
let g:pear_tree_repeatable_expand = 0

highlight PMenu ctermbg=none guibg=none

"peartree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
imap <BS> <Plug>(PearTreeBackspace)
" Mappings for CR and Esc are handled in the CoC maps

"markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

let g:vim_markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript',
    \ 'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

let g:mkdp_auto_close = 0

""polyglot
let g:polyglot_disabled = ['python', 'latex', 'typescript'] " Use python-syntax and vimtex
let g:jsx_ext_required = 0
let g:markdown_fenced_languages = ['javascript', 'python', 'clojure', 'ruby']

"python syntax
let g:python_highlight_all = 1

"colorizer
let g:colorizer_auto_filetype='css,html'

"tex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex --interaction=nonstopmode $*'

"better whitespace
let g:better_whitespace_ctermcolor='red'
let g:better_whitespace_guicolor='red'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

"neosnippets
imap <M-k>     <Plug>(neosnippet_expand_or_jump)
smap <M-k>     <Plug>(neosnippet_expand_or_jump)
xmap <M-k>     <Plug>(neosnippet_expand_target)
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"Other configuration
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

autocmd FocusLost * silent! wa

autocmd StdinReadPre * let s:std_in=1
autocmd BufWritePre * :%s/\s+$//e

autocmd Filetype *tex set spell
autocmd Filetype *tex nnoremap <silent> <F2> :silent make\|redraw!\|cw<CR>
"autocmd BufWritePost *.tex <F2>
autocmd FileType json syntax match Comment +\/\/.\+$+

" starphleet specific
au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh

"quick buffer swap
nnoremap <leader>b :e#<CR>
"quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
"quick split
nnoremap <Leader>v <C-w>v<C-w>w

nmap <silent><Leader>/ :let @/=""<CR>
vnoremap < <gv
vnoremap > >gv
vnoremap . :normal .<CR>

cmap w!! w !sudo tee % > /dev/null

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
"nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

"vim-go
" Autoimport on save in Go.
augroup filetype_go
    autocmd!
    autocmd BufWritePre *.go :GoFmt
    autocmd BufWritePre *.go :GoImports
augroup END
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"
let g:go_snippet_engine = "neosnippet"
au FileType go nnoremap <Leader>gv <Plug>(go-doc-vertical)
autocmd FileType go nmap <leader>gr :w<CR>:vsplit <bar> terminal go run %<CR>

"tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>

"other
nnoremap <leader>nn :set nonumber!<CR>
nnoremap <leader>rr :set norelativenumber!<CR>
"

" spelling
hi clear SpellBad
hi SpellBad gui=underline cterm=underline

"denite
" Define mappings
augroup user_plugin_denite
  autocmd!

  autocmd FileType denite call s:denite_settings()
  autocmd FileType denite-filter call s:denite_filter_settings()
  autocmd User denite-preview call s:denite_preview()

"  autocmd VimResized * call s:denite_resize(g:denite_position)

  " Enable Denite special cursor-line highlight
  autocmd WinEnter * if &filetype =~# '^denite'
        \ |   highlight! link CursorLine WildMenu
        \ | endif

  " Disable Denite special cursor-line highlight
  autocmd WinLeave * if &filetype ==# 'denite'
        \ |   highlight! link CursorLine NONE
        \ | endif
augroup END

function! s:denite_settings() abort
  " Window options
  setlocal signcolumn=no cursorline

  " Denite selection window key mappings
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
  nnoremap <silent><buffer><expr> q    denite#do_map('quit')
  nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
  nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
  nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
  nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

" Denite-preview window settings
function! s:denite_preview() abort
  " Window options
  setlocal nocursorline colorcolumn= signcolumn=no nonumber nolist nospell

  if &lines > 35
    resize +8
  endif
  " let l:pos = win_screenpos(win_getid())
  " let l:heighten = &lines - l:pos[0]
  " execute 'resize ' . l:heighten

  " Clear indents
  if exists('*indent_guides#clear_matches')
    call indent_guides#clear_matches()
  endif
endfunction

" Denite-filter window settings
function! s:denite_filter_settings() abort
  " Window options
  setlocal signcolumn=yes nocursorline nonumber norelativenumber

  " Disable Deoplete auto-completion within Denite filter window
  if exists('*deoplete#custom#buffer_option')
    call deoplete#custom#buffer_option('auto_complete', v:false)
  endif

  " Denite Filter window key mappings
  imap <silent><buffer> jj          <Plug>(denite_filter_quit)
  nmap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
  imap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
  nmap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
  imap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
  inoremap <silent><buffer> <Tab>
        \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <S-Tab>
        \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

" Denite general settings
call denite#custom#option('_', {
      \ 'prompt': '❯',
      \ 'auto_resume': 1,
      \ 'start_filter': 1,
      \ 'statusline': 1,
      \ 'smartcase': 1,
      \ 'vertical_preview': 1,
      \ 'max_dynamic_update_candidates': 50000,
      \ })

" Interactive grep search
call denite#custom#var('grep', 'min_interactive_pattern', 2)
call denite#custom#source('grep', 'args', ['', '', '!'])

if has('nvim')
  call denite#custom#option('_', {
        \ 'statusline': 0,
        \ 'split': 'floating',
        \ 'floating_preview': 1,
        \ 'filter_split_direction': 'floating',
        \ })
endif

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

call denite#custom#var('file/rec', 'command',
\ ['ag', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', {
  \ 'command': ['ag'],
  \ 'default_opts': ['--vimgrep', '-i', '--hidden'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': [],
  \ 'final_opts': [],
  \ 'separator': ['--'],
  \ })


" Change default action.
call denite#custom#kind('file', 'default_action', 'tabswitch')

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <C-x>b :Denite buffer<CR>
nnoremap <C-x>f :Denite file<CR>

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
