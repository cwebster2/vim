local M = {}

local notify = require("notify")

function M.setup()
  notify.setup({
    background_colour = "#000000",
  })
  -- vim.notify = notify
end

return M
