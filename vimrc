let fortran_free_source=1
set noautoindent
set textwidth=0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set scrolloff=5

set hlsearch
set incsearch
set showmatch
set matchtime=5
set laststatus=2

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
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'chriskempson/base16-vim'
Plug 'travisjeffery/vim-gotosymbol'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'vim-latex/vim-latex'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'Yggdroot/indentLine'

call plug#end()

"set mouse=a

let mapleader=','

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"au InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <C-o> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufWritePre * :%s/\s+$//e
au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh

" GLG specific
au BufRead,BufNewFile after_containerize,on_containerize,orders set filetype=sh

" Autoimport on save in Go.
augroup filetype_go
    autocmd!
    autocmd BufWritePre *.go :GoFmt
    autocmd BufWritePre *.go :GoImports
augroup END

"nnoremap <leader>n :set nonumber!<CR>
"nnoremap <leader>rn :set norelativenumber!<CR>

if has('nvim-0.3.2') || has("patch-8.1.0360")
  set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif

set t_Co=256
"filetype plugin indent on
syntax on

set ttimeoutlen=50
set noshowmode

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
"let g:airline_theme='simple'
let g:indentLine_char = '▏'
let g:indentLine_color_term = 239

" LATEX
"
if version >= 700
  autocmd Filetype *tex set spell
endif

autocmd Filetype *tex nnoremap <silent> <F2> :silent make\|redraw!\|cw<CR>

let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex --interaction=nonstopmode $*'

"autocmd BufWritePost *.tex <F2>

" spelling
hi clear SpellBad
hi SpellBad cterm=underline

