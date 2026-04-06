return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    -- branch = "nightly",
    event = "VeryLazy",
    keys = {
      {
        "<leader>gg",
        function()
          require("neogit").open()
        end,
        desc = "Open Neogit",
      },
    },
    opts = {
      integrations = {
        diffview = true,
        telescope = true,
      },
    },
  },
}
