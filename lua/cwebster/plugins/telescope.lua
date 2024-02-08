return {
  -- PLUGINS: Finders and pickers
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    event = "BufEnter",
    version = false,
    -- keys = {},
    dependencies = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "lsp-trouble.nvim" },
    },
    config = function()
      local actions = require("telescope.actions")
      local trouble = require("trouble.providers.telescope")

      actions.select_default:replace(function()
        return actions.select_default() + actions.center()
      end)

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<CR>"] = actions.select_default + actions.center,
              ["<C-p>"] = actions.select_default + actions.center,
              ["<C-e>"] = actions.move_selection_previous,
              ["<esc>"] = actions.close,
              ["<C-t>"] = trouble.open_with_trouble,
              ["<C-h>"] = actions.which_key,
            },
            n = {
              ["<CR>"] = actions.select_default + actions.center,
              -- next | prev
              ["i"] = false,
              ["j"] = false,
              ["n"] = actions.move_selection_next,
              ["e"] = actions.move_selection_previous,
              ["<C-t>"] = trouble.open_with_trouble,
              ["<C-h>"] = actions.which_key,
            },
          },
          sorting_strategy = "ascending",
          file_ignore_patterns = { "^%.git$", "node_modules" },
          path_display = { "absolute" },
          winblend = 5,
          set_env = { ["COLORTERM"] = "truecolor" },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {
      "telescope.nvim",
      "fzf.vim",
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  { "nvim-telescope/telescope-github.nvim" },
  { "nvim-telescope/telescope-symbols.nvim" },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "cwebster2/github-coauthors.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("telescope").load_extension("githubcoauthors")
    end,
  },
  { "junegunn/fzf", build = "./install --all" },
  { "junegunn/fzf.vim" },
  {
    "pwntester/octo.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("octo").setup()
      require("telescope").load_extension("octo")
    end,
  },
}
