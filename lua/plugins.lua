
vim.api.nvim_exec([[
  "plugins

  if empty(glob("~/.vim/autoload/plug.vim"))
    echo "Installing Vim-Plug\n"
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')

  " LSP stuff
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'nvim-lua/completion-nvim'
  Plug 'puremourning/vimspector'

  " colorschemes
  Plug 'glepnir/zephyr-nvim'
  Plug 'sainnhe/sonokai'
  Plug 'nanotech/jellybeans.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'cwebster2/vim-airline-themes'

  " visuals
  Plug 'airblade/vim-gitgutter'

  " linting
  Plug 'w0rp/ale'

  " language stuff
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdcommenter'
  "Plug 'Yggdroot/indentLine'

  "Plug 'tpope/vim-sensible'
  "Plug 'editorconfig/editorconfig-vim'
  "Plug 'airblade/vim-rooter'
  "Plug 'mattn/emmet-vim'
  "Plug 'terryma/vim-multiple-cursors'
  "Plug 'tpope/vim-eunuch'
  "Plug 'tpope/vim-surround'
  ""Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'Raimondi/delimitMate'
  ""Plug 'sheerun/vim-polyglot'  " syntax files for most languages
  ""Plug 'vim-python/python-syntax'  " Improved python syntax
  ""Plug 'Vimjas/vim-python-pep8-indent'  " Proper python indenting
  "Plug 'chrisbra/Colorizer'  " Highlight CSS colors
  "Plug 'vim-latex/vim-latex'
  ""Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
  "Plug 'ntpeters/vim-better-whitespace'
  ""Plug 'Shougo/neosnippet.vim'
  ""Plug 'Shougo/neosnippet-snippets'
  "Plug 'honza/vim-snippets'
  "Plug 'luochen1990/rainbow'
  "Plug 'liuchengxu/vista.vim'
  "Plug 'plasticboy/vim-markdown'
  "Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
  ""Plug 'jaxbot/github-issues.vim'
  "Plug 'junegunn/gv.vim'
  "Plug 'rhysd/git-messenger.vim'
  "Plug 'jreybert/vimagit'
  "Plug 'ryanoasis/vim-devicons'
  ""Plug 'mhinz/vim-startify'
  "Plug 'unblevable/quick-scope'

  call plug#end()

]], '')
