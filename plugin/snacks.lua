require("snacks").setup({
  animate = { enabled = true },
  bigfile = { enabled = true },
  bufdelete = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      { section = "header" },
      { section = "keys", gap = 1 },
      {
        icon = " ",
        title = "Recent Files",
        section = "recent_files",
        indent = 2,
        padding = { 2, 2 },
      },
      { section = "startup" },
    },
  },
  gitbrowse = { enabled = true },
  git = { enabled = "true" },
  quickfile = { enabled = true },
  terminal = {},
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  zen = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
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
  styles = {
    notification = {
      wo = { wrap = true },
    },
  },
})
