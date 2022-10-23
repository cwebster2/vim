local M = {}
local hlslens = require("hlslens")

M.setup = function()
  hlslens.setup({
    calm_down = false,
    nearest_only = false,
    nearest_float_when = 'auto',
    virt_priority = 50,
  })
end

return M
