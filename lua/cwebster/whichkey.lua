local M = {}

function M.setup()
  require("which-key").setup({
    operators = { gc = "Comments", ys = "Surround", yS = "Surround" },
    window = { winblend = 30 },
  })
end

return M
