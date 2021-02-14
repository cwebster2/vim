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
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require'_telescope' end
    }
    use('nvim-telescope/telescope-fzy-native.nvim')
    use('nvim-telescope/telescope-fzf-writer.nvim')
    use('nvim-telescope/telescope-packer.nvim')
    use('nvim-telescope/telescope-github.nvim')
    use('nvim-telescope/telescope-symbols.nvim')
    use('nvim-telescope/telescope-vimspector.nvim')
    use {'junegunn/fzf', run = './install --all'}
    use 'junegunn/fzf.vim'

  -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    --use 'nvim-treesitter/nvim-treesitter-refactor'
    --use 'romgrk/nvim-treesitter-context'
    use 'p00f/nvim-ts-rainbow'
    use 'kosayoda/nvim-lightbulb'
    --plug('glepnir/lspsaga.nvim')

  -- Completion
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use{'hrsh7th/nvim-compe',
      requires = {{'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'}},
    }

    --use{'nvim-lua/completion-nvim',
    --use 'steelsojka/completion-buffers'
    --use 'nvim-treesitter/completion-treesitter'

  -- Snippets

  -- colorschemes
    use 'nanotech/jellybeans.vim'
    use 'glepnir/zephyr-nvim'
    use 'sainnhe/sonokai'
    use 'christianchiarulli/nvcode-color-schemes.vim'
    use 'bluz71/vim-nightfly-guicolors'

  -- visuals
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
      'glepnir/galaxyline.nvim',
      branch='main',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
      'RRethy/vim-hexokinase',
      run = "make hexokinase",
      config = function() require'_hexokinase'.setup() end
    }
    use 'cwebster2/color-overrides.nvim'
    use 'airblade/vim-gitgutter'
    use {'szw/vim-maximizer', opt=true, cmd="MaximizerToggle"}

  -- linting
  --plug('w0rp/ale')

  -- language stuff
    use {'tpope/vim-fugitive', opt=true, cmd="Gstatus"}
    use {'scrooloose/nerdcommenter'}
    use 'Yggdroot/indentLine'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use 'editorconfig/editorconfig-vim'
    use 'ntpeters/vim-better-whitespace'

  -- ide stuff
    use {'liuchengxu/vista.vim',
      --config = function() require'_vista'.setup() end,
      --cmd = "Vista",
      --opt = true
      }
    use 'unblevable/quick-scope'
    use {'kyazdani42/nvim-tree.lua',
      --config = function() require'_nvimtree'.setup() end,
      --cmd = {"NvimTreeFindFile", "NvimTreeToggle"},
      --opt = true
    }
    use 'tmsvg/pear-tree'
  --plug('cohama/lexima.vim')
    use {'kassio/neoterm', opt=true, cmd="Ttoggle"}
    use 'junegunn/gv.vim'
    use {'janko/vim-test', opt=true}
    --use {'puremourning/vimspector', opt=true, fn="vimspector#Launch"}
    use {'puremourning/vimspector'}


  -- markdown
    use {'plasticboy/vim-markdown', opt=true}
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown'}

    use {'vim-latex/vim-latex', opt=true, ft='tex'}
    use 'airblade/vim-rooter'

    use 'tpope/vim-eunuch'
    use 'tpope/vim-surround'


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
