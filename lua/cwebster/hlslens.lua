local M = {}
local hlslens = require("hlslens")

M.setup = function()
  hlslens.setup({
    calm_down = true,
    nearest_only = true,
    nearest_float_when = 'always'
  })
end

return M
