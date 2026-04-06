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

