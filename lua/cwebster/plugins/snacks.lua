return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = {
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = false, -- "",
          git_hl = false,
        },
        git = {
          patterns = { "GitSign", "MinDiffSign" },
        },
        refresh = 50,
      },
    }
  },
}
