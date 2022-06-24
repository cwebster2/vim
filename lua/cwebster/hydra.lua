local M = {}
local hydra = require("hydra")

function M.setup()
  hydra({
    name = "Window Ops",
    mode = "n",
    -- config = {},
    body = "<C-w>",
    heads = {
      -- move
      {"m", "<C-w>h"},
      {"n", "<C-w>j"},
      {"e", "<C-w>k"},
      {"i", "<C-w>l"},
    },
  })
end

return M
