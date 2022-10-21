local M = {}

local noice = require("noice")

function M.setup()
  noice.setup({
    cmdline = {
      view = "cmdline"
    },
    popupmenu = {
      backend = "cmp"
    },
    lsp_progress = {
      enabled = true,
    },
    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
      }
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true }
      },
      {
        filter = {
          event = "cmdline",
          find = "^%s*[/?]",
        },
        view = "cmdline",
      },
    },
  })
end

return M
