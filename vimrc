let fortran_free_source=1
set noautoindent
set textwidth=0
set shiftwidth=3
set softtabstop=3
set number
set scrolloff=5

set nohlsearch
set incsearch
set showmatch
set matchtime=5
set laststatus=2

let mapleader=','

map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <F8> :TlistToggle<CR>

"nnoremap <leader>n :set nonumber!<CR>
"nnoremap <leader>rn :set norelativenumber!<CR>

set t_Co=256
"filetype plugin indent on
syntax on

set ttimeoutlen=50
set noshowmode

execute pathogen#infect()
let g:powerline_symbols="fancy"


