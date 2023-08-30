return {
  -- PLUGINS: Syntax
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() require('cwebster.syntax').setup() end
  },
  { "nvim-treesitter/playground" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  -- these are broken with curreng version of neovim
  {
    "romgrk/nvim-treesitter-context",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  },

  { "HiPhish/nvim-ts-rainbow2" },
  { "windwp/nvim-ts-autotag" },
}
