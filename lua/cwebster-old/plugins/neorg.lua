return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    -- ft = "norg",
    -- cmd = "Neorg",
    dependencies = {
      "luarocks.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
  },
}
