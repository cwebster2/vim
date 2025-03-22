return {
  {
    "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    opts = {
      filetypes = { markdown = false },
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "giuxtaposition/blink-cmp-copilot",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    module = "copilot_cmp",
    dependencies = { "copilot.lua" },
    opts = {
      method = "getCompletionsCycling",
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      -- debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
