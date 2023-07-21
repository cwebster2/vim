-- local Util = require("lazy.core.util")

local M = {}

-- M.inlay_hints = false

-- function M.toggle()
--   M.inlay_hints = not M.inlay_hints
-- end

function M.on_attach(client, buf)
  if client.server_capabilities.inlayHintProvider then
    vim.g.inlay_hints_visible = true
    vim.lsp.inlay_hint(buf, true)
  end
end

return M
