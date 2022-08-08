local M = {}

function M.setup()
  -- for copilot.nvim
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ""
  vim.g.copilot_node_command = "~/.local/share/fnm/node-versions/v16.15.1/installation/bin/node"

  -- for copilot.lua
  -- require("copilot").setup{
  --   cmp = {
  --     enabled = true,
  --     method = "getCompletionsCycling",
  --   },
  --    ft_disable = {"markdown"},
  --   server_opts_overrides = {
  --     cmd = { os.getenv("HOME") .. "/.local/share/fnm/node-versions/v16.15.1/installation/bin/node", require("copilot.util").get_copilot_path(vim.fn.stdpath("data") .. "/site/pack/packer") },
  --   }
  -- }
end

return M
