local M = {}

function M.setup()
  -- for copilot.nvim
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""

  -- for copilot.lua
  require("copilot").setup{
     ft_disable = {"markdown"},
  }
end

return M
