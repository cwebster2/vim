local ok, sb = pcall(require, "scrollbar")

if not ok then
  print("scrollbar not installed, run PackerSync")
  do return end
end

local colors = require("cwebster.colors").get_colors()

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
