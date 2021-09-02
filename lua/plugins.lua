local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

execute 'packadd packer.nvim'

return require('packer').startup {
  function(use)
    use {'wbthomason/packer.nvim'}
    use 'dstein64/vim-startuptime'
    use 'mhinz/vim-startify'

  -- fuzzy stuff
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = "require('_telescope')",
    }
    use('nvim-telescope/telescope-fzy-native.nvim')
    use('nvim-telescope/telescope-fzf-writer.nvim')
    use('nvim-telescope/telescope-packer.nvim')
    use('nvim-telescope/telescope-github.nvim')
    use('nvim-telescope/telescope-symbols.nvim')
    -- use('nvim-telescope/telescope-vimspector.nvim')
    use 'nvim-telescope/telescope-dap.nvim'
    use('cwebster2/github-coauthors.nvim')
    use {'junegunn/fzf', run = './install --all'}
    use 'junegunn/fzf.vim'

  -- Syntax
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
      config = "require('_syntax').setup()"
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/nvim-treesitter-refactor'
    use {
      'romgrk/nvim-treesitter-context',
      requires = {'nvim-treesitter/nvim-treesitter'}
    }
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'

  -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'folke/lua-dev.nvim'
    use 'kosayoda/nvim-lightbulb'
    use('glepnir/lspsaga.nvim')
    use{'ray-x/lsp_signature.nvim'}
    use {
      "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = "require('_trouble').setup()",
    }

  -- Completion
    use{'hrsh7th/nvim-compe',
      requires = {{'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'}},
    }

  -- colorschemes
    use 'nanotech/jellybeans.vim'
    use {'Pocco81/Catppuccino.nvim'}
    use 'glepnir/zephyr-nvim'
    use 'sainnhe/sonokai'
    use 'EdenEast/nightfox.nvim'

  -- visuals
    use {
      -- 'romgrk/barbar.nvim',
      'akinsho/nvim-bufferline.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = "require('_bufferline').setup()",
    }
    use {
      'glepnir/galaxyline.nvim',
      branch='main',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
      'RRethy/vim-hexokinase',
      run = "make hexokinase",
      config = "require'_hexokinase'.setup()",
    }
    use 'cwebster2/color-overrides.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      requires = {'nvim-lua/plenary.nvim'},
      config = "require('_gitsigns').setup()",
    }
    use {'szw/vim-maximizer', opt=true, cmd="MaximizerToggle"}

    use {
      "folke/which-key.nvim",
      config = "require('_whichkey').setup()",
    }

  -- linting
  --plug('w0rp/ale')

  -- language stuff
    use {
      'TimUntersberger/neogit',
      requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
      config = "require('_neogit').setup()",
    }
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'simrat39/rust-tools.nvim',
      config = "require('_rust-tools').setup()"
    }
    use 'editorconfig/editorconfig-vim'
    use 'ntpeters/vim-better-whitespace'

  -- ide stuff
    --use {'liuchengxu/vista.vim',
      --config = function() require'_vista'.setup() end,
      --cmd = "Vista",
      --opt = true
    --  }
    use "terrortylor/nvim-comment"
    use 'simrat39/symbols-outline.nvim'
    use 'unblevable/quick-scope'
    use {'kyazdani42/nvim-tree.lua',
      -- commit = 'f1f1488',
      --config = function() require'_nvimtree'.setup() end,
      --cmd = {"NvimTreeFindFile", "NvimTreeToggle"},
      --opt = true
    }
    use 'pwntester/octo.nvim'
    use 'tmsvg/pear-tree'
    -- plug('cohama/lexima.vim')
    -- use {'kassio/neoterm', opt=true, cmd="Ttoggle"}
    use {'akinsho/nvim-toggleterm.lua',
      config = 'require("_neoterm").setup()',
    }
    use 'junegunn/gv.vim'
    use {'janko/vim-test', opt=true}
    -- use {'puremourning/vimspector'}
    use {'mfussenegger/nvim-dap',
      config = 'require("_dap").setup()'
    }
    use 'theHamsta/nvim-dap-virtual-text'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- markdown
    use {'plasticboy/vim-markdown', opt=true}
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = 'markdown'}

    use {'vim-latex/vim-latex', opt=true, ft='tex'}
    use 'airblade/vim-rooter'

    use 'tpope/vim-eunuch'
    use 'tpope/vim-surround'

    use 'andweeb/presence.nvim'
    -- use {'oberblastmeister/neuron.nvim',
    --   config = 'require("_neuron").setup()'
    -- }

    use {'theprimeagen/neovim-irc-ui'}

  -- still evaluating if these are needed now
  --Plug 'mattn/emmet-vim'
  --Plug 'terryma/vim-multiple-cursors' -- need to rebind its c-n key to use it
  --Plug 'Raimondi/delimitMate' -- closes quotes and stuff
  use 'sheerun/vim-polyglot'  -- syntax files for most languages
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

