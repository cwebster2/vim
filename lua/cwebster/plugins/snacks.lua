return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      notifier = {},
      statuscolumn = {
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = true, -- "",
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
