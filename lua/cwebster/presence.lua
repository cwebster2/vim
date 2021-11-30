local M = {}

function M.setup()
  require("presence"):setup({
    editing_text = "Editing [REDACTED]",
    workspace_text = "[REDACTED]",
    file_explorer_text = "Browsing [REDACTED]",
    reading_text = "Reading [REDACTED]",
  })
end

return M
