local M = {}
local gps = require("nvim-gps")

function M.setup()
  gps.setup({
    icons = {
      ["class-name"] = ' ',      -- Classes and class-like objects
      ["function-name"] = ' ',   -- Functions
      ["method-name"] = ' '      -- Methods (functions inside class-like objects)
    },
    -- Disable any languages individually over here
    -- Any language not disabled here is enabled by default
    languages = {
      -- ["bash"] = false,
    },
    separator = ' > ',
    depth = 0,
    depth_limit_indicator = "..",
  })
end

return M
