local M = {}

local sb = require("scrollbar")
local colors = require("cwebster.colors").get_colors()

function M.setup()
  sb.setup({
  handle = {
      text = " ",
      color = colors.black,
    },
    marks = {
      Search = { text = { "-", "=" }, priority = 0, colors.orange },
      Error = { text = { "-", "=" }, priority = 1, colors.red },
      Warn = { text = { "-", "=" }, priority = 2, colors.yellow },
      Info = { text = { "-", "=" }, priority = 3, colors.blue },
      Hint = { text = { "-", "=" }, priority = 4, colors.green },
      Misc = { text = { "-", "=" }, priority = 5, colors.purple },
    },
    excluded_filetypes = {
      "",
      "prompt",
      "TelescopePrompt",
    },
    autocmd = {
      render = {
        "BufWinEnter",
        "TabEnter",
        "TermEnter",
        "WinEnter",
        "CmdwinLeave",
        "TextChanged",
        "VimResized",
        "WinScrolled",
      },
    },
    handlers = {
      diagnostic = true,
      search = true,
    },
  })
end

return M
