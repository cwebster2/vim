return {
  -- PLUGINS: copilot
  -- { "github/copilot.vim",
  --   init = "require('cwebster.copilot').setup()"
  -- }
  {
    "zbirenbaum/copilot.lua",
    event = {"VimEnter"},
    config = function()
      vim.defer_fn(function()
        require('cwebster.copilot').setup()
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    module = "copilot_cmp",
    dependencies = { "copilot.lua" },
    config = function() require("copilot_cmp").setup({
      method = "getCompletionsCycling"
    }) end,
  },
}
