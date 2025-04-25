return {
  {
    "christoomey/vim-tmux-navigator",
    enabled = true,
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
  },
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    enabled = false,
    event = "VeryLazy",
    keys = {
      {
        "<M-m>",
        "<cmd>ZellijNavigateLeftTab<cr>",
        { silent = true, desc = "navigate left or tab" },
      },
      { "<M-n>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
      { "<M-e>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
      {
        "<M-i>",
        "<cmd>ZellijNavigateRightTab<cr>",
        { silent = true, desc = "navigate right or tab" },
      },
    },
    opts = {},
  },
}
