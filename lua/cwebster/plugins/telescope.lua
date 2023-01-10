return {
  -- PLUGINS: Finders and pickers
  { "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    -- keys = {},
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "lsp-trouble.nvim" },
    },
    config = function() require('cwebster.telescope') end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {
      "telescope.nvim",
      "fzf.vim"
    },
    -- config = function()
    --   require('telescope').load_extension('fzf')
    -- end,
  },

  { "nvim-telescope/telescope-packer.nvim" },
  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  { "nvim-telescope/telescope-dap.nvim",
    dependencies = { "telescope.nvim" },
    -- config = function()
    --   require('telescope').load_extension('dap')
    -- end,
  },
  { "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "telescope.nvim" },
    -- config = function()
    --   require('telescope').load_extension('ui-select')
    -- end,
  },
  { "cwebster2/github-coauthors.nvim",
    dependencies = { "telescope.nvim" },
    -- config = function()
    --   require('telescope').load_extension('github-coauthors')
    -- end,
  },
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },
  { "pwntester/octo.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("octo").setup()
      -- require('telescope').load_extension('octo')
    end,
  },
}
