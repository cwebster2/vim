local M = {}

local node = os.getenv("HOME") .. "/.local/share/fnm/node-versions/v16.15.1/installation/bin/node"

function M.setup()
  -- for copilot.nvim
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""
  vim.g.copilot_node_command = node

  -- for copilot.lua
  require("copilot").setup{
    ft_disable = {"markdown"},
    copilot_node_command = node
  }
end

return M
