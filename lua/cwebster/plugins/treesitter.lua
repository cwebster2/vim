return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "nvim-treesitter/nvim-treesitter-refactor" },
    { "nvim-treesitter/playground" },
    { "windwp/nvim-ts-autotag" },
  },
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      sync_install = false,
      auto_install = true,
      modules = {},
      ignore_install = { "haskell" },
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {},
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = true },
        clear_on_cursor_move = true,
      },
      autotag = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        }
      }
    })
  -- config = function() require('cwebster.syntax').setup() end
  end,
}
