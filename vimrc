let fortran_free_source=1
set noautoindent
set textwidth=0
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set number
set scrolloff=5

set nohlsearch
set incsearch
set showmatch
set matchtime=5
set laststatus=2

execute pathogen#infect()

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
nnoremap <silent> <F9> :NERDTreeToggle<CR>

"nnoremap <leader>n :set nonumber!<CR>
"nnoremap <leader>rn :set norelativenumber!<CR>

set t_Co=256
"filetype plugin indent on
syntax on

set ttimeoutlen=50
set noshowmode

let g:powerline_symbols="fancy"

let g:airline_left_sep=''
let g:airline_right_sep=''


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

