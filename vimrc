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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install()}}
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
else
  Plug 'Shougo/denite.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#denite#enabled = 1
let g:airline#extensions#fugutive#enabled = 1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
"let g:airline_theme='simple'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': ' ',
  \ '1': '➊ ',
  \ '2': '➋ ',
  \ '3': '➌ ',
  \ '4': '➍ ',
  \ '5': '➎ ',
  \ '6': '➏ ',
  \ '7': '➐ ',
  \ '8': '➑ ',
  \ '9': '➒ '
  \}

"indentline
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#222222'

"nerdtree
nnoremap <silent> <leader>d :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>D :NERDTreeFind<CR>
let NERDTreeIgnore = ['\.pyc', '__pycache__', '.egg-info[[dir]]', 'pip-wheel-metadata[[dir]]', 'node_modules']
let NERDTreeQuitOnOpen=0
let NERDTreeKeepTreeInNewTab=1
let NERDTreeShowHidden=1
let NERDTreeChDirMode=0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"nerdtree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

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

" Check if NERDTree is open or active
function! s:isNERDTreeOpen()
  "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
  return exists("g:NERDTree") && g:NERDTree.IsOpen()
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
"function! s:syncTree()
  "if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    "NERDTreeFind
    "wincmd p
  "endif
"endfunction

" Highlight currently open buffer in NERDTree
"autocmd BufEnter * call s:syncTree()

"peartree
let g:pear_tree_repeatable_expand = 0

"nerdcommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

highlight PMenu ctermbg=none guibg=none

"ale
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['E%d', 'W%d', 'K']
let g:ale_maximum_file_size = 500000
let g:ale_rust_rls_executable = $HOME . '/.cargo/bin/rls'
let g:ale_go_langserver_executable  = $HOME . '/go/bin/go-langserver'
let g:ale_python_pyls_config = {'pyls': {'plugins': {'pycodestyle': {'enabled': v:false}}}}
"let g:ale_completion_tsserver_autoimport = 1
let g:go_fmt_fail_silently = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
"let g:ale_open_list = 1
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let b:ale_fixers = {
  \  '*': ['remove_trailing_lines', 'trim_whitespace'],
  \  'typescript': ['prettier'],
  \  'javascript': ['prettier'],
  \  'css': ['prettier'],
  \  'python': ['black'],
  \ }
"gofmt golint go vet
let g:ale_linters = {
  \ 'bash': ['language_server', 'shell'],
  \ 'sh': ['shell'],
  \ 'zsh': ['shell'],
  \ 'cpp': ['clang', 'cppcheck'],
  \ 'go': ['golangserver'],
  \ 'rust': ['cargo', 'rls'],
  \ 'javascript': ['eslint', 'tsserver'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'python': ['flake8', 'mypy', 'pyls'],
  \ }
let g:ale_pattern_options = {
\   '.*\.md$': {'ale_enabled': 0},
\   '.*\.markdown$': {'ale_enabled': 0},
\   '.*\.rst$': {'ale_enabled': 0},
\   '.*\.txt$': {'ale_enabled': 0},
\   '.*\.tex$': {'ale_enabled': 0},
\}
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>r :lrewind<CR>
nnoremap <leader>eo :lopen<CR>
nnoremap <leader>ec :lclose<CR>
highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
nmap <leader>= <Plug>(ale_fix)
nmap <leader>- :ALEToggleBuffer<cr>

"peartree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
imap <BS> <Plug>(PearTreeBackspace)
" Mappings for CR and Esc are handled in the CoC maps

"coc
let g:coc_global_extensions='coc-eslint coc-json coc-css coc-python coc-rls coc-tsserver coc-highlight coc-git coc-emmet coc-markdownlint coc-yank coc-neosnippet'
inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ?  "\<TAB>" :
  \ coc#refresh()
snoremap <silent><expr> <Tab>
  \ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"
inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr>
  \ pumvisible() ? "\<C-y>" :
  \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Esc>
  \ pumvisible() ? "\<C-e>" :
  \ "\<Esc>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ex  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

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

"fzf
let g:fzf_command_prefix = 'F'
let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter'
" Set custom layout.
let g:fzf_layout = {
\ 'window': 'silent 18split enew'
\ }

" Set actions manually.
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-e': 'split',
\ 'ctrl-v': 'vsplit'
\ }

" History directory.
let g:fzf_history_dir = $HOME . '/.vim/cache/share/fzf/'

" Customize `fzf` colors to match current color scheme.
let g:fzf_colors = {
\ 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'Comment'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment']
\ }
nnoremap <silent> <C-p> :FGFiles<Enter>
nnoremap <silent> <Leader><C-p> :FFiles<Enter>
nnoremap <silent> <M-x> :FCommands<Enter>
nnoremap <silent> <M-b> :FBuffers<Enter>
command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))

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
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
