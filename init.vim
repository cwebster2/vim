if !exists('g:vscode')

map <Space> <Leader>
set shell=/bin/bash
set nocompatible

let g:python3_host_prog = $HOME . '/miniconda3/bin/python3'
let g:loaded_netrwPlugin = 1
""polyglot
let g:polyglot_disabled = ['python', 'latex', 'typescript'] " Use python-syntax and vimtex
let g:jsx_ext_required = 0
let g:markdown_fenced_languages = ['javascript', 'python', 'clojure', 'ruby']

"plugins

if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing Vim-Plug\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'cwebster2/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mattn/emmet-vim'
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
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vista.vim'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"Plug 'jaxbot/github-issues.vim'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'jreybert/vimagit'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'unblevable/quick-scope'

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
set fillchars+=vert:│
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

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" Colors

let g:jellybeans_overrides = {
  \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
  \   'VertSplit': { 'ctermbg': 'none', 'guibg': 'none', '256ctermbg': 'none' }
  \}
if has('termguicolors') && &termguicolors
  let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
lef g:jellybeans_use_term_italics = 1
colorscheme jellybeans

"startify
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]
let g:startify_bookmarks = [
            \ { 'c': '~/.config/i3/config' },
            \ { 'k': '~/.config/kitty/kitty.conf' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ '~/src',
            \ ]

"quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

"fzf
"this needs to be here rather than in after/plugins
let g:fzf_command_prefix = 'F'

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

" Mappings for CR and Esc are handled in the CoC maps
highlight PMenu ctermbg=Black guibg=#191919
highlight PMenuSel guifg=#ffffff guibg=#333333

"markdown
augroup mkdown
  autocmd!
  autocmd FileType markdown let b:coc_pairs_disabled = ['`']
augroup end

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

let g:vim_markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'typescript',
    \ 'go', 'python', 'py=python', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']

let g:mkdp_auto_close = 0


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
"imap <expr> <C-j> vsnip#jumpable(1) ? "<Plug>(neosnippet-expand-or-jump)" : "<C-j>"
"imap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(neosnippet-jump-prev)"      : "<C-k>"
imap <M-k>     <Plug>(neosnippet_expand_or_jump)
smap <M-k>     <Plug>(neosnippet_expand_or_jump)
xmap <M-k>     <Plug>(neosnippet_expand_target)
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


"Other configuration
nnoremap <C-M> <C-W><C-H>
nnoremap <C-N> <C-W><C-J>
nnoremap <C-E> <C-W><C-K>
nnoremap <C-I> <C-W><C-L>
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap gf :vertical wincmd f<CR>
inoremap <silent> <TAB> :bnext<CR>
inoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

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
"nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
"vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>


"vista
nnoremap <silent> <leader>tb :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

augroup vistavim
  autocmd!
""  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
  " Close vim if vista is the last split/tab open
  autocmd WinEnter * if &ft == 'vista' && winnr('$') == 1 | q | endif
  autocmd TabLeave * if &ft == 'vista' | wincmd w | endif
augroup END

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }


"other
nnoremap <leader>nn :set nonumber!<CR>
nnoremap <leader>rr :set norelativenumber!<CR>
"

" spelling
"hi clear SpellBad
hi clear SpellCap
"hi SpellBad ctermfg='Red' guifg='Red' gui=underline,bold cterm=underline,bold
hi SpellCap guibg=NONE guisp='Red' gui=undercurl cterm=undercurl,bold

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

endif
