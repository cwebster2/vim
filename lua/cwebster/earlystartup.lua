local M = {}
local g = vim.g

function M.setup()
  -- some globals that need setting before plugins are loaded
  g.python3_host_prog = os.getenv("HOME") .. '/miniconda3/bin/python3'
  g.loaded_netrwPlugin = 1
  g.jsx_ext_required = 0

  -- these need to get setup before plugins run
  local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

return M

