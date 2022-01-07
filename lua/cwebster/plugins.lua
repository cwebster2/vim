local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

execute "packadd packer.nvim"

return require("packer").startup {
  function(use)
    use { "wbthomason/packer.nvim" }
    use { "dstein64/vim-startuptime" }
    use { "mhinz/vim-startify",
      config = "require('cwebster.startify').setup()",
    }
    use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

  -- fuzzy stuff
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
      config = "require('cwebster.telescope')",
    }
    use { "nvim-telescope/telescope-fzy-native.nvim" }
    use { "nvim-telescope/telescope-fzf-writer.nvim" }
    use { "nvim-telescope/telescope-packer.nvim" }
    use { "nvim-telescope/telescope-github.nvim" }
    use { "nvim-telescope/telescope-symbols.nvim" }
    use { "nvim-telescope/telescope-dap.nvim" }
    use { "cwebster2/github-coauthors.nvim" }
    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }

  -- Syntax
    use { "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = "require('cwebster.syntax').setup()"
    }
    use { "nvim-treesitter/playground" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-treesitter/nvim-treesitter-refactor" }
    use {
      "romgrk/nvim-treesitter-context",
      requires = {"nvim-treesitter/nvim-treesitter"}
    }
    use { "p00f/nvim-ts-rainbow" }
    use { "windwp/nvim-ts-autotag" }
    use {
      "SmiteshP/nvim-gps",
      requires = {"nvim-treesitter/nvim-treesitter"},
      config = "require('cwebster.nvimgps').setup()",
    }

  -- LSP stuff
    use { "neovim/nvim-lspconfig" }
    use { "folke/lua-dev.nvim" }
    use { "kosayoda/nvim-lightbulb" }
    use { "tami5/lspsaga.nvim" }
    use { "nvim-lua/lsp-status.nvim" }
    use { "ray-x/lsp_signature.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = "require('cwebster.trouble').setup()",
    }

  -- Completion
    use { "hrsh7th/nvim-cmp",
      config = function()
        require("cwebster.lsp").setup()
        require("cwebster.completion").setup()
      end,
      requires = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "Saecki/crates.nvim",
        "f3fora/cmp-spell"
      },
    }

  -- colorschemes
    use {
      "catppuccin/nvim",
      as = "catppucin"
    }

  -- visuals
    use {
      "akinsho/nvim-bufferline.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = "require('cwebster.bufferline').setup()",
    }
    use {
      "NTBBloodbath/galaxyline.nvim",
      branch="main",
      config = "require('cwebster.galaxyline')",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {
      "petertriho/nvim-scrollbar",
        config = "require('cwebster.scrollbar').setup()",
    }
    use {
      "RRethy/vim-hexokinase",
      run = "make hexokinase",
      config = "require('cwebster.hexokinase').setup()",
    }
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = "require('cwebster.gitsigns').setup()",
    }
    use {"szw/vim-maximizer", opt=true, cmd="MaximizerToggle"}

    use {
      "zeertzjq/which-key.nvim",
      branch = "patch-1",
      -- "folke/which-key.nvim",
      config = function()
        require("cwebster.whichkey").setup()
      end,
      -- track until merged https://github.com/folke/which-key.nvim/pull/227
    }

  -- language stuff
    use {
      "TimUntersberger/neogit",
      commit = "e507909",
      requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
      config = "require('cwebster.neogit').setup()",
    }
    use { "lukas-reineke/indent-blankline.nvim",
      config = "require('cwebster.indentline').setup()",
    }
    use { "simrat39/rust-tools.nvim",
      config = "require('cwebster.rust-tools').setup()"
    }
    use {
      "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = "require('cwebster.rest').setup()"
    }
    use { "editorconfig/editorconfig-vim" }
    use { "ntpeters/vim-better-whitespace",
      config = "require('cwebster.whitespace').setup()",
    }

  -- ide stuff
    use { "terrortylor/nvim-comment" }
    use { "simrat39/symbols-outline.nvim",
      config = "require('cwebster.symbols').setup()",
    }
    use { "unblevable/quick-scope" }
    use { "kyazdani42/nvim-tree.lua",
      -- commit = "f1f1488",
      config = function() require("cwebster.nvimtree").setup() end,
      --cmd = {"NvimTreeFindFile", "NvimTreeToggle"},
      --opt = true
    }
    use { "pwntester/octo.nvim" }
    use { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup() end,
    }
    use {"akinsho/nvim-toggleterm.lua",
      config = "require('cwebster.neoterm').setup()",
    }
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
      -- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
    }

    use { "github/copilot.vim",
      setup = "require('cwebster.copilot').setup()"
    }
    use { "junegunn/gv.vim" }

  -- testing
    use { "janko/vim-test",
        opt=true
    }

  -- debugging
    use { "mfussenegger/nvim-dap",
      config = "require('cwebster.dap').setup()"
    }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- markdown
    use { "plasticboy/vim-markdown",
        opt=true,
        setup = "require('cwebster/markdown').markdown_setup()",
    }
    use { "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = "markdown",
        setup = "require('cwebster/markdown').mkdp_setup()",
    }

    use { "vim-latex/vim-latex",
        opt=true,
        ft="tex"
    }
    use { "airblade/vim-rooter" }

    use { "tpope/vim-eunuch" }
    use { "tpope/vim-surround" }

    use { "andweeb/presence.nvim",
      config = "require('cwebster.presence').setup()",
    }
    -- use {"oberblastmeister/neuron.nvim",
    --   config = "require("_neuron").setup()"
    -- }

    use {'KadoBOT/nvim-spotify',
      requires = { "nvim-telescope/telescope.nvim" },
      config = "require('cwebster.spotify').setup()",
      run = 'make'
    }

    use { "theprimeagen/neovim-irc-ui" }

  -- still evaluating if these are needed now
  --Plug "mattn/emmet-vim"
  --Plug "terryma/vim-multiple-cursors" -- need to rebind its c-n key to use it
  --Plug "Raimondi/delimitMate" -- closes quotes and stuff
    --ses quotes and stuff
  use { "sheerun/vim-polyglot" }  -- syntax files for most languages
  --Plug "vim-python/python-syntax"  " Improved python syntax
  --Plug "Vimjas/vim-python-pep8-indent"  " Proper python indenting
  --Plug "chrisbra/Colorizer"  " Highlight CSS colors
  --Plug "fatih/vim-go", {"for": "go", "do": ":GoUpdateBinaries" }
  --Plug "jaxbot/github-issues.vim"
  --Plug "rhysd/git-messenger.vim"
  --Plug "jreybert/vimagit"

  end,
  config = {
    _display = {
      open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don"t have our plugins ;)
        local ok, float_win = pcall(function()
          return require("plenary.window.float").percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]

          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.bufnr
        local win = float_win.win_id

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, "winblend", 10)

        return win, bufnr
      end
    },
  }
}

