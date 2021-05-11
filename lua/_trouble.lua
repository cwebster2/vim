local M = {}

M.setup = function()
  require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    action_keys = {
      previous = "e",
      next = "n"
    },
    auto_open = true,
    use_lsp_diagnostic_signs = true
  }
end

return M
