return {
  -- PLUGINS_BEGIN
  -- PLUGINS: Colorschemes
  { "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function() require("cwebster.colors").setup() end,
  },

  -- PLUGINS: Core
  { "dstein64/vim-startuptime" },


-- PLUGINS: Startup
  { "mhinz/vim-startify" },

-- stuff to try
-- https://github.com/nyngwang/NeoTerm.lua
-- https://github.com/pianocomposer321/yabs.nvim
-- https://github.com/Shatur/neovim-session-manager
-- https://github.com/kosayoda/nvim-lightbulb with new config
-- nvim-neorg/neorg

-- PLUGINS: Finders and pickers
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
    }
  },
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { "nvim-telescope/telescope-packer.nvim" },
  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "cwebster2/github-coauthors.nvim" },
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },

-- PLUGINS: Syntax
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  -- these are broken with curreng version of neovim
  -- {
  --   "romgrk/nvim-treesitter-context",
  --   dependencies = {"nvim-treesitter/nvim-treesitter"}
  -- }

  { "p00f/nvim-ts-rainbow" },
  { "windwp/nvim-ts-autotag" },

-- PLUGINS: diagnostics
  { "mfussenegger/nvim-lint" },
  { "folke/lsp-trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  { url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },

-- PLUGINS: Completion
  { "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-cmdline",
      "Saecki/crates.nvim",
      "f3fora/cmp-spell",
      {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"}
    },
  },

-- PLUGINS: UI
  {
    "akinsho/nvim-bufferline.lua",
    dependencies = {"kyazdani42/nvim-web-devicons"},
  },
  { "rebelot/heirline.nvim", },
  { "kevinhwang91/nvim-hlslens",
    dependencies = { "petertriho/nvim-scrollbar" }
  },
  { "lewis6991/gitsigns.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
  },
  {"szw/vim-maximizer", lazy=true, cmd="MaximizerToggle"},
  { "SmiteshP/nvim-navic",
    dependencies = {"neovim/nvim-lspconfig"},
  },
  { "anuvyklack/hydra.nvim" },
  { "folke/which-key.nvim" },
  { "stevearc/dressing.nvim" },

  { "folke/noice.nvim",
    event = "VimEnter",
    config = function() require("cwebster.ui.noice").setup() end,
    dependencies = {
      {
        "rcarriga/nvim-notify",
        config = function() require("cwebster.ui.notify").setup() end,
      },
    }
  },

-- PLUGINS: language stuff
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
  },
  { "lukas-reineke/indent-blankline.nvim" },
  { "simrat39/rust-tools.nvim" },
  { "NTBBloodbath/rest.nvim",
    dependencies = {"nvim-lua/plenary.nvim"}
  },
  { "editorconfig/editorconfig-vim" },
  { "ntpeters/vim-better-whitespace" },

-- PLUGINS: PDE features
  { "terrortylor/nvim-comment" },
  { "simrat39/symbols-outline.nvim" },
  { "unblevable/quick-scope" },
  { "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },
  { "pwntester/octo.nvim" },
  { "kylechui/nvim-surround",
    tag = "*",
  },
  { "windwp/nvim-autopairs" },
  { "akinsho/nvim-toggleterm.lua" },
  { "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "haydenmeade/neotest-jest",
    }
  },
  { "cwebster2/mocha-runner.nvim" },
  { "ThePrimeagen/refactoring.nvim",
    dependencies = {
      {"nvim-lua/plenary.nvim"},
      {"nvim-treesitter/nvim-treesitter"}
    }
    -- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
  },
  { "metakirby5/codi.vim" },
  { "junegunn/gv.vim" },
  { "uga-rosa/ccc.nvim" },
  { "almo7aya/openingh.nvim" },

-- PLUGINS: copilot
  -- { "github/copilot.vim",
  --   setup = "require('cwebster.copilot').setup()"
  -- }
  {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require('cwebster.copilot').setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
    dependencies = { "copilot.lua" },
    config = function() require("copilot_cmp").setup({
      method = "getCompletionsCycling"
    }) end,
  },


-- PLUGINS: Testing
  { "janko/vim-test",
      lazy=true
  },

-- PLUGINS: Debugging
  { "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },

-- PLUGINS: Markdown
  -- { "plasticboy/vim-markdown",
  --   ft = {"markdown"},
  --   setup = function() require('cwebster.markdown').markdown_setup() end,
  -- }
  { "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    -- ft = { "markdown" },
    -- setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    init = function() require('cwebster.markdown').mkdp_setup() end,
  },

  -- PLUGINS: LaTeX
  { "vim-latex/vim-latex",
      ft="tex"
  },

  -- PLUGINS: The Rest
  { "airblade/vim-rooter" },
  { "tpope/vim-eunuch" },

-- still evaluating if these are needed now
--Plug "mattn/emmet-vim"
  { "sheerun/vim-polyglot" },  -- syntax files for most languages

}

