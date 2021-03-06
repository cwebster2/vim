local M = {}
local neogit = require("neogit")

function M.setup()
  neogit.setup({
    disable_signs = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = true,
    signs = {
      -- { CLOSED, OPENED }
      section = { ">", "v" },
      item = { ">", "v" },
      hunk = { "", "" },
    },
    integrations = {
      diffview = true,
    },
    -- mappings = {},
  })
end

return M
