local M = {}

local spotify = require("nvim-spotify")

function M.setup()
  spotify.setup {
    status = {
      update_interval = 10000,
      format = "%s %t by %a",
    }
  }
end

return M
