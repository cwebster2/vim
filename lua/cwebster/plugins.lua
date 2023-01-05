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
  -- PLUGINS_BEGIN
  -- PLUGINS: Core
    use { "wbthomason/packer.nvim" }
    use { "dstein64/vim-startuptime" }

  -- PLUGINS: Colorschemes
    use { "catppuccin/nvim",
      as = "catppuccin",
    }

  -- PLUGINS: Startup
    use { "mhinz/vim-startify" }

  -- stuff to try
  -- https://github.com/nyngwang/NeoTerm.lua
  -- https://github.com/pianocomposer321/yabs.nvim
  -- https://github.com/Shatur/neovim-session-manager
  -- https://github.com/kosayoda/nvim-lightbulb with new config
  -- nvim-neorg/neorg

  -- PLUGINS: Finders and pickers
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"},
      }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { "nvim-telescope/telescope-packer.nvim" }
    use { "nvim-telescope/telescope-github.nvim" }
    use { "nvim-telescope/telescope-symbols.nvim" }
    use { "nvim-telescope/telescope-dap.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "cwebster2/github-coauthors.nvim" }
    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }

  -- PLUGINS: Syntax
    use { "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use { "nvim-treesitter/playground" }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-treesitter/nvim-treesitter-refactor" }
    -- these are broken with curreng version of neovim
    -- use {
    --   "romgrk/nvim-treesitter-context",
    --   requires = {"nvim-treesitter/nvim-treesitter"}
    -- }

    use { "p00f/nvim-ts-rainbow" }
    use { "windwp/nvim-ts-autotag" }

  -- PLUGINS: LSP
    use { "williamboman/mason.nvim" }
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "folke/neodev.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "onsails/lspkind.nvim" }

  -- PLUGINS: diagnostics
    use { "mfussenegger/nvim-lint" }
    use { "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }

  -- PLUGINS: Completion
    use { "hrsh7th/nvim-cmp",
      requires = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lsp-document-symbol",
        "hrsh7th/cmp-cmdline",
        "Saecki/crates.nvim",
        "f3fora/cmp-spell",
        {"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}
      },
    }



  -- PLUGINS: UI
    use {
      "akinsho/nvim-bufferline.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
    }
    use {
      "rebelot/heirline.nvim", }
    use {
      "kevinhwang91/nvim-hlslens",
      requires = { "petertriho/nvim-scrollbar" }
    }
    use { "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
    }
    use {"szw/vim-maximizer", opt=true, cmd="MaximizerToggle"}
    use { "SmiteshP/nvim-navic",
      requires = {"neovim/nvim-lspconfig"},
    }
    use { "anuvyklack/hydra.nvim" }
    use { "folke/which-key.nvim" }
    use { "stevearc/dressing.nvim" }

    use { "folke/noice.nvim",
      event = "VimEnter",
      config = function() require("cwebster.ui.noice").setup() end,
      requires = {
        {
          "rcarriga/nvim-notify",
          config = function() require("cwebster.ui.notify").setup() end,
        },
      }
    }

  -- PLUGINS: language stuff
    use {
      "TimUntersberger/neogit",
      requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
    }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "simrat39/rust-tools.nvim" }
    use { "NTBBloodbath/rest.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }
    use { "editorconfig/editorconfig-vim" }
    use { "ntpeters/vim-better-whitespace" }

  -- PLUGINS: PDE features
    use { "terrortylor/nvim-comment" }
    use { "simrat39/symbols-outline.nvim" }
    use { "unblevable/quick-scope" }
    use { "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      }
    }
    use { "pwntester/octo.nvim" }
    use { "kylechui/nvim-surround",
      tag = "*",
    }
    use { "windwp/nvim-autopairs" }
    use { "akinsho/nvim-toggleterm.lua" }
    use { "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "haydenmeade/neotest-jest",
      }
    }
    use { "cwebster2/mocha-runner.nvim" }
    use { "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
      -- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
    }
    use { "metakirby5/codi.vim" }
    use { "junegunn/gv.vim" }
    use { "uga-rosa/ccc.nvim" }
    use { "almo7aya/openingh.nvim" }

  -- PLUGINS: copilot
    -- use { "github/copilot.vim",
    --   setup = "require('cwebster.copilot').setup()"
    -- }
    use{
      "zbirenbaum/copilot.lua",
      event = {"VimEnter"},
      config = function()
        vim.defer_fn(function()
          require('cwebster.copilot').setup()
        end, 100)
      end,
    }
    use {
      "zbirenbaum/copilot-cmp",
      module = "copilot_cmp",
      after = { "copilot.lua" },
      config = function() require("copilot_cmp").setup({
        method = "getCompletionsCycling"
      }) end,
    }


  -- PLUGINS: Testing
    use { "janko/vim-test",
        opt=true
    }

  -- PLUGINS: Debugging
    use { "mfussenegger/nvim-dap" }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- PLUGINS: Markdown
    -- use { "plasticboy/vim-markdown",
    --   ft = {"markdown"},
    --   setup = function() require('cwebster.markdown').markdown_setup() end,
    -- }
    use { "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      -- ft = { "markdown" },
      -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      setup = function() require('cwebster.markdown').mkdp_setup() end,
    }

    -- PLUGINS: LaTeX
    use { "vim-latex/vim-latex",
        ft="tex"
    }

    -- PLUGINS: The Rest
    use { "airblade/vim-rooter" }
    use { "tpope/vim-eunuch" }

  -- still evaluating if these are needed now
  --Plug "mattn/emmet-vim"
  use { "sheerun/vim-polyglot" }  -- syntax files for most languages

  -- PLUGINS_END
  end,
  config = {
    profile = {
      enable = true,
      threshold = 1,
    },
  }
}

