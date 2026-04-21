require("obsidian").setup({
  ui = { enable = false },
  legacy_commands = false,
  workspaces = {
    -- {
    --   name = "personal",
    --   path = "~/vaults/personal",
    -- },
    {
      name = "work",
      path = "~/vaults/work",
      overrides = {
        notes_subdir = "notes",
      },
    },
  },
})
