return {
  -- PLUGINS_BEGIN
  -- PLUGINS: Colorschemes
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      config = function()
        require("cwebster.colors").setup()
      end,
    },

  -- PLUGINS: Core
    { "wbthomason/packer.nvim" },
    { "dstein64/vim-startuptime" },

  -- PLUGINS: Startup
    { "mhinz/vim-startify",
      config = function() require('cwebster.startify').setup() end,
    },

  -- stuff to try
  -- https://github.com/nyngwang/NeoTerm.lua
  -- https://github.com/pianocomposer321/yabs.nvim
  -- https://github.com/Shatur/neovim-session-manager
  -- https://github.com/kosayoda/nvim-lightbulb with new config
  -- nvim-neorg/neorg

  -- PLUGINS: Finders and pickers
    { "nvim-telescope/telescope.nvim",
      dependencies = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "pwntester/octo.nvim",
          config = function() require("octo").setup() end,
        },
        { "cwebster2/github-coauthors.nvim" },
      },
      config = function() require('cwebster.telescope') end,
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
      config = function() require('cwebster.syntax').setup() end
    },
    { "nvim-treesitter/playground" },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
    -- these are broken with curreng version of neovim
    -- {,
    --   "romgrk/nvim-treesitter-context",
    --   dependencies = {"nvim-treesitter/nvim-treesitter"}
    -- }

    { "p00f/nvim-ts-rainbow" },
    { "windwp/nvim-ts-autotag" },

  -- PLUGINS: LSP
    { "williamboman/mason.nvim" },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
      },
      config = function()
        require("cwebster.lsp.installer").setup()
        require("cwebster.lsp").setup()
      end
    },
    { "folke/neodev.nvim" },
    { "ray-x/lsp_signature.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "onsails/lspkind.nvim" },

  -- PLUGINS: diagnostics
    { "mfussenegger/nvim-lint",
      config = function() require("cwebster.diagnostics.nvimlint").setup() end,
    },
    { "folke/lsp-trouble.nvim",
      dependencies = "kyazdani42/nvim-web-devicons",
      config = function() require("cwebster.trouble").setup() end,
    },
    { "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function() require("lsp_lines").setup() end,
    },

  -- PLUGINS: Completion
    { "hrsh7th/nvim-cmp",
      config = function()
        require("cwebster.completion").setup()
      end,
      dependencies = {
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
        {"petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim"}
      },
    },


  -- PLUGINS: UI
    {
      "akinsho/nvim-bufferline.lua",
      dependencies = {"kyazdani42/nvim-web-devicons"},
      config = function() require('cwebster.ui.bufferline').setup() end,
    },
    {
      "rebelot/heirline.nvim",
      config = function() require("cwebster.heirline").setup() end,
    },
    {
      "kevinhwang91/nvim-hlslens",
      config = function() require('cwebster.ui.hlslens').setup() end,
      dependencies = {
        "petertriho/nvim-scrollbar",
          config = function() require('cwebster.ui.scrollbar').setup() end,
      }
    },
    {
      "lewis6991/gitsigns.nvim",
      dependencies = {"nvim-lua/plenary.nvim"},
      config = function() require('cwebster.ui.gitsigns').setup() end,
    },
    {"szw/vim-maximizer", lazy = true, cmd="MaximizerToggle"},
    {
      "SmiteshP/nvim-navic",
      dependencies = {"neovim/nvim-lspconfig"},
      config = function() require('cwebster.ui.navic').setup() end,
    },
    {
      "anuvyklack/hydra.nvim",
      config = function() require("cwebster.hydra").setup() end,
    },
    { "folke/which-key.nvim",
      config = function() require("cwebster.whichkey").setup() end,
    },
    { "stevearc/dressing.nvim",
      config = function() require("cwebster.ui.dressing").setup() end,
    },
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
      -- commit = "64245bb7f577bad0308d77dc1116ce7d8428f27f", --works
      dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim"},
      config = function() require('cwebster.neogit').setup() end,
      module = "neogit",
    },
    { "lukas-reineke/indent-blankline.nvim",
      config = function() require('cwebster.indentline').setup() end,
    },
    { "simrat39/rust-tools.nvim",
      config = function() require('cwebster.rust-tools').setup() end
    },
    {
      "NTBBloodbath/rest.nvim",
      dependencies = {"nvim-lua/plenary.nvim"},
      config = function() require('cwebster.rest').setup() end
    },
    { "editorconfig/editorconfig-vim" },
    { "ntpeters/vim-better-whitespace",
      config = function() require('cwebster.whitespace').setup() end,
    },

  -- PLUGINS: PDE features
    { "terrortylor/nvim-comment",
      config = function() require("nvim_comment").setup({ comment_empty = false }) end
    },
    { "simrat39/symbols-outline.nvim",
      config = function() require('cwebster.symbols').setup() end,
    },
    { "unblevable/quick-scope" },
    { "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function() require("cwebster.neotree").setup() end,
    },
    { "kylechui/nvim-surround",
      version = "*",
      config = function() require("cwebster.surround").setup() end,
    },
    { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup() end,
    },
    {"akinsho/nvim-toggleterm.lua",
      config = function() require('cwebster.neoterm').setup() end,
    },
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "haydenmeade/neotest-jest",
      },
      config = function() require("cwebster.neotest").setup() end,
    },
    {
      "cwebster2/mocha-runner.nvim",
      config = function() require("mocha-runner").setup({}) end,
    },
    {
      "ThePrimeagen/refactoring.nvim",
      dependencies = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
      -- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
    },
    { "metakirby5/codi.vim" },
    { "junegunn/gv.vim" },
    { "uga-rosa/ccc.nvim" ,
      config = function() require("cwebster.ui.ccc").setup() end,
    },
    { "almo7aya/openingh.nvim" },

  -- PLUGINS: copilot
    -- { "github/copilot.vim",
    --   init = "require('cwebster.copilot').setup()"
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
        lazy = true
    },

  -- PLUGINS: Debugging
    { "mfussenegger/nvim-dap",
      config = function() require('cwebster.dap').setup() end
    },
    { "theHamsta/nvim-dap-virtual-text" },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap"} },

  -- PLUGINS: Markdown
    -- { "plasticboy/vim-markdown",
    --   ft = {"markdown"},
    --   init = function() require('cwebster.markdown').markdown_setup() end,
    -- }
    { "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      -- ft = { "markdown" },
      -- init = function() vim.g.mkdp_filetypes = { "markdown" } end,
      init = function() require('cwebster.markdown').mkdp_setup() end,
    },

    -- PLUGINS: LaTeX
    { "vim-latex/vim-latex",
        ft="tex"
    },

    -- PLUGINS: The Rest
    { "airblade/vim-rooter" },
    { "tpope/vim-eunuch" },

    { "andweeb/presence.nvim",
      config = function() require('cwebster.presence').setup() end,
    },

    {'KadoBOT/nvim-spotify',
      dependencies = { "nvim-telescope/telescope.nvim" },
      config = function() require('cwebster.spotify').setup() end,
      build = 'make',
      cmd = "Spotify"
    },

  -- still evaluating if these are needed now
  --Plug "mattn/emmet-vim"
  { "sheerun/vim-polyglot",
    init = function() vim.g.polyglot_disabled = { "autoindent", "sensible" } end,
    },  -- syntax files for most languages

  -- PLUGINS_END
}

