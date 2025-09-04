return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
  },
  opts = {
    -- prompts = {
    --   Commit = {
    --     selection = select.buffer,
    --   },
    -- },
    -- debug = true, -- Enable debugging
    -- See Configuration section for rest
    -- mappings = {
    --   accept_diff = {
    --     normal = "<M-y>",
    --     insert = "<M-y>",
    --   },
    -- },
    -- selection = function(source)
    --   return select.visual(source) or select.buffer(source)
    -- end,
  },
  -- setup = function(_, opts)
  --   local select = require("CopilotChat.select")
  --   require("CopilotChat").setup(opts)
  -- end,
  -- See Commands section for default commands if you want to lazy load on them
}
