return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<M-m>", "<cmd>TmuxNavigateLeft<cr>" },
    { "<M-n>", "<cmd>TmuxNavigateDown<cr>" },
    { "<M-e>", "<cmd>TmuxNavigateUp<cr>" },
    { "<M-i>", "<cmd>TmuxNavigateRight<cr>" },
    -- { '<C-\\>', '<cmd>TmuxNavigatePrevious<cr>' },
  },
}
