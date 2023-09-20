return {
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    opts = {
      filetypes = { markdown = false },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
    dependencies = { "copilot.lua" },
    opts = {
      method = "getCompletionsCycling",
    },
  },
}
