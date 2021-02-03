local M = {}

local function plug(source, options)
  options = options or ""
  if (string.len(options) > 0) then
    options = ", "..options
  end
  vim.api.nvim_command("Plug '"..source.."'"..options)
end

local function plug_begin()
vim.api.nvim_exec([[
  "plugins

  if empty(glob("~/.vim/autoload/plug.vim"))
    echo "Installing Vim-Plug\n"
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif

  call plug#begin('~/.vim/plugged')

]], '')
end

local function plug_end()
vim.api.nvim_exec([[
  call plug#end()
]], '')
end

function M.setup()
  plug_begin()

  -- LSP stuff
  plug('nvim-lua/plenary.nvim')
  plug('nvim-lua/popup.nvim')
  plug('nvim-telescope/telescope.nvim')
  plug('neovim/nvim-lspconfig')
  plug('nvim-treesitter/nvim-treesitter', '{\'do\': \':TSUpdate\'}')
  plug('nvim-treesitter/nvim-treesitter-textobjects')
  plug('nvim-treesitter/nvim-treesitter-refactor')
  plug('romgrk/nvim-treesitter-context')
  plug('p00f/nvim-ts-rainbow')
  plug('nvim-lua/completion-nvim')
  plug('puremourning/vimspector')
  --plug('glepnir/lspsaga.nvim')

  -- colorschemes
  plug('glepnir/zephyr-nvim')
  plug('sainnhe/sonokai')
  plug('nanotech/jellybeans.vim')
  plug('vim-airline/vim-airline')
  plug('cwebster2/vim-airline-themes')

  -- visuals
  plug('airblade/vim-gitgutter')
  plug('kyazdani42/nvim-web-devicons')
  plug('ryanoasis/vim-devicons')
  plug('szw/vim-maximizer')

  -- linting
  --plug('w0rp/ale')

  -- language stuff
  --plug('junegunn/fzf', '{ \'do\': { -> fzf#install() } }')
  --plug('junegunn/fzf.vim')
  plug('tpope/vim-fugitive')
  plug('scrooloose/nerdcommenter')
  plug('Yggdroot/indentLine')
  plug('lukas-reineke/indent-blankline.nvim', '{ \'branch\': \'lua\'}')
  plug('editorconfig/editorconfig-vim')
  plug('ntpeters/vim-better-whitespace')

  -- ide stuff
  plug('liuchengxu/vista.vim')
  plug('unblevable/quick-scope')
  plug('kyazdani42/nvim-tree.lua')
  plug('tmsvg/pear-tree')
  plug('kassio/neoterm')
  plug('junegunn/gv.vim')
  plug('janko/vim-test')

  -- markdown
  plug('plasticboy/vim-markdown')
  plug('iamcco/markdown-preview.nvim', '{ \'do\': { -> mkdp#util#install() }, \'for\': [\'markdown\', \'vim-plug\']}')

  -- snippets
  plug('Shougo/neosnippet.vim')
  plug('Shougo/neosnippet-snippets')
  plug('honza/vim-snippets')

  plug('vim-latex/vim-latex')
  plug('airblade/vim-rooter')

  plug('tpope/vim-eunuch')
  plug('tpope/vim-surround')

  plug('mhinz/vim-startify')

  -- still evaluating if these are needed now
  --Plug 'mattn/emmet-vim'
  --Plug 'terryma/vim-multiple-cursors' -- need to rebind its c-n key to use it
  --Plug 'Raimondi/delimitMate' -- closes quotes and stuff
  --Plug 'sheerun/vim-polyglot'  " syntax files for most languages
  --Plug 'vim-python/python-syntax'  " Improved python syntax
  --Plug 'Vimjas/vim-python-pep8-indent'  " Proper python indenting
  --Plug 'chrisbra/Colorizer'  " Highlight CSS colors
  --Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
  --Plug 'jaxbot/github-issues.vim'
  --Plug 'rhysd/git-messenger.vim'
  --Plug 'jreybert/vimagit'

  plug_end()
end

return M
