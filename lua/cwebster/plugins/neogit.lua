return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    branch = "nightly",
    event = "VeryLazy",
    opts = {
      disable_signs = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = true,
      signs = {
        -- { CLOSED, OPENED }
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
      },
      integrations = {
        diffview = true,
      },
    },
  },
}
