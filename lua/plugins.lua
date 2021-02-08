local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

return require('packer').startup {
  function(use)
    use {'wbthomason/packer.nvim', opt = true}
    use 'dstein64/vim-startuptime'
    use 'mhinz/vim-startify'

  -- fuzzy stuff
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use('nvim-telescope/telescope-fzy-native.nvim')
    use('nvim-telescope/telescope-fzf-writer.nvim')
    use('nvim-telescope/telescope-packer.nvim')
    use('nvim-telescope/telescope-github.nvim')
    use('nvim-telescope/telescope-symbols.nvim')
    use {'junegunn/fzf', run = './install --all'}
    use 'junegunn/fzf.vim'

  -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/completion-treesitter'
    use 'romgrk/nvim-treesitter-context'
    use 'p00f/nvim-ts-rainbow'
  --plug('glepnir/lspsaga.nvim')

  -- Completion
    use 'nvim-lua/completion-nvim'
    --use 'steelsojka/completion-buffers'

  -- Snippets
    use 'Shougo/neosnippet.vim'
    use 'Shougo/neosnippet-snippets'
    use 'honza/vim-snippets'

  -- colorschemes
    use 'glepnir/zephyr-nvim'
    use 'sainnhe/sonokai'
    use 'vim-airline/vim-airline'
    use 'cwebster2/vim-airline-themes'

  -- visuals
    use 'airblade/vim-gitgutter'
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'
    use 'szw/vim-maximizer'

  -- linting
  --plug('w0rp/ale')

  -- language stuff
    use 'tpope/vim-fugitive'
    use 'scrooloose/nerdcommenter'
    use 'Yggdroot/indentLine'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'editorconfig/editorconfig-vim'
    use 'ntpeters/vim-better-whitespace'

  -- ide stuff
    use 'liuchengxu/vista.vim'
    use 'unblevable/quick-scope'
    use 'kyazdani42/nvim-tree.lua'
    use 'tmsvg/pear-tree'
  --plug('cohama/lexima.vim')
    use 'kassio/neoterm'
    use 'junegunn/gv.vim'
    use 'janko/vim-test'
    use 'puremourning/vimspector'


  -- markdown
    use 'plasticboy/vim-markdown'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

    use 'vim-latex/vim-latex'
    use 'airblade/vim-rooter'

    use 'tpope/vim-eunuch'
    use 'tpope/vim-surround'

    use 'nanotech/jellybeans.vim'

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

  end,
  config = {
    _display = {
      open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]

          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.bufnr
        local win = float_win.win_id

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
}
