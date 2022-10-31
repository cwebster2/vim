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
    lsp = {
      progress = {
        enabled = true,
      },
      override = {
        ["cmp.entry.get_documentation"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      }
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
