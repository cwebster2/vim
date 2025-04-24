return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require("tokyonight").setup({
        -- transparent = true,
        styles = {
          comments = { italic = true },
        },
      })

      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },

  {
    "catppuccin/nvim",
    priority = 1000, -- Make sure to load this before all the other start plugins.
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        flavours = { "mocha" },
        styles = {
          comments = { "italic" },
        },
        integrations = {
          gitsigns = true,
          treesitter = true,
          mini = {
            enabled = true,
          },
          blink_cmp = true,
          dap = true,
          dap_ui = true,
          diffview = true,
          dropbar = {
            enabled = true,
            color_mode = true,
          },
          indent_blankline = {
            enabled = true,
          },
          native_lsp = {
            enabled = true,
          },
          neogit = true,
          mason = true,
          snacks = true,
          telescope = true,
          which_key = true,
        },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
