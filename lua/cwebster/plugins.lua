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
    use {
      "nathom/filetype.nvim",
      config = function() require('cwebster.filetype').setup() end
    }
    use { "antoinemadec/FixCursorHold.nvim" } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open

  -- PLUGINS: Startup
    use { "mhinz/vim-startify",
      config = "require('cwebster.startify').setup()",
    }

  -- stuff to try
  -- https://github.com/nyngwang/NeoTerm.lua
  -- https://github.com/pianocomposer321/yabs.nvim
  -- https://github.com/Shatur/neovim-session-manager
  -- https://github.com/kosayoda/nvim-lightbulb with new config
  -- ChristianChiarulli/codi.vim
  -- nvim-neorg/neorg

  -- PLUGINS: Finders and pickers
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      },
      config = "require('cwebster.telescope')",
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
      config = "require('cwebster.syntax').setup()"
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
    use {
      "williamboman/nvim-lsp-installer",
      {
        "neovim/nvim-lspconfig",
        config = function()
          require("cwebster.lsp.installer").setup()
          require("cwebster.lsp").setup()
        end
      }
    }
    use { "folke/lua-dev.nvim" }
    -- use { "kosayoda/nvim-lightbulb" }
    use { "nvim-lua/lsp-status.nvim" }
    use { "ray-x/lsp_signature.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    use { "onsails/lspkind.nvim" }

  -- PLUGINS: diagnostics
    use { "mfussenegger/nvim-lint",
      config = function() require("cwebster.diagnostics.nvimlint").setup() end,
    }
    use { "folke/lsp-trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require("cwebster.trouble").setup() end,
    }
    use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function() require("lsp_lines").setup() end,
    }

  -- PLUGINS: Completion
    use { "hrsh7th/nvim-cmp",
      config = function()
        require("cwebster.completion").setup()
      end,
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
        -- "hrsh7th/cmp-copilot",
        {"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"}
      },
    }


  -- PLUGINS: Colorschemes
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      -- config = function() require("cwebster.colors.catppuccin").setup() end,
    }

  -- PLUGINS: UI
    use {
      "akinsho/nvim-bufferline.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = "require('cwebster.bufferline').setup()",
    }
    use {
      "rebelot/heirline.nvim",
      config = function() require("cwebster.heirline").setup() end,
    }
    use {
      "petertriho/nvim-scrollbar",
        config = "require('cwebster.scrollbar').setup()",
    }
    use {
      "kevinhwang91/nvim-hlslens",
      config = "require('cwebster.hlslens').setup()",
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
      "SmiteshP/nvim-gps",
      requires = {"nvim-treesitter/nvim-treesitter"},
      config = "require('cwebster.nvimgps').setup()",
    }
    use {
      "anuvyklack/hydra.nvim",
      config = function() require("cwebster.hydra").setup() end,
    }
    use {
      "lazytanuki/nvim-mapper",
      config = function() require("nvim-mapper").setup({ no_map = true }) end,
      before = "telescope.nvim"
    }

  -- PLUGINS: language stuff
    use {
      "TimUntersberger/neogit",
      -- commit = "e507909",
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

  -- PLUGINS: ide features
    use { "terrortylor/nvim-comment" }
    use { "simrat39/symbols-outline.nvim",
      config = "require('cwebster.symbols').setup()",
    }
    use { "unblevable/quick-scope" }
    use { "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function() require("cwebster.neotree").setup() end,
    }
    use { "pwntester/octo.nvim",
      config = function() require("octo").setup() end,
    }
    use { "kylechui/nvim-surround",
      tag = "*",
      config = function() require("cwebster.surround").setup() end,
    }
    use { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup() end,
    }
    use {"akinsho/nvim-toggleterm.lua",
      config = "require('cwebster.neoterm').setup()",
    }
    -- https://github.com/nvim-neotest/neotest
    use {
      "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "haydenmeade/neotest-jest",
      },
      config = function() require("cwebster.neotest").setup() end,
    }
    use {
      "cwebster2/mocha-runner.nvim",
      config = function() require("mocha-runner").setup({}) end,
    }
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
      -- TODO setup https://github.com/ThePrimeagen/refactoring.nvim
    }
    use { "metakirby5/codi.vim" }

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

    use { "junegunn/gv.vim" }

  -- PLUGINS: Testing
    use { "janko/vim-test",
        opt=true
    }

  -- PLUGINS: Debugging
    use { "mfussenegger/nvim-dap",
      config = "require('cwebster.dap').setup()"
    }
    use { "theHamsta/nvim-dap-virtual-text" }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- PLUGINS: Markdown
    use { "plasticboy/vim-markdown",
        opt=true,
        setup = "require('cwebster/markdown').markdown_setup()",
    }
    use { "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        ft = "markdown",
        setup = "require('cwebster/markdown').mkdp_setup()",
    }

    -- PLUGINS: LaTeX
    use { "vim-latex/vim-latex",
        opt=true,
        ft="tex"
    }

    -- PLUGINS: The Rest
    use { "airblade/vim-rooter" }
    use { "tpope/vim-eunuch" }

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

  -- still evaluating if these are needed now
  --Plug "mattn/emmet-vim"
  --Plug "terryma/vim-multiple-cursors" -- need to rebind its c-n key to use it
  use { "sheerun/vim-polyglot" }  -- syntax files for most languages
  --Plug "rhysd/git-messenger.vim"

  -- PLUGINS_END
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

