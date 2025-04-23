return {
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      {
        "<m-m>",
        "<cmd>ZellijNavigateLeftTab<cr>",
        { silent = true, desc = "navigate left or tab" },
      },
      { "<m-n>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
      { "<m-e>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
      {
        "<m-i>",
        "<cmd>ZellijNavigateRightTab<cr>",
        { silent = true, desc = "navigate right or tab" },
      },
    },
    opts = {},
  },
}
