local M = {}
local ccc = require("ccc")

function M.setup()
  ccc.setup({
    highlighter = {
      auto_enable = true
    }
  })
end

return M
