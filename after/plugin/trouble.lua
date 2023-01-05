local ok, trouble = pcall(require, "trouble")

if not ok then
  print("trouble not installed, run PackerSync")
  do return end
end

local map = require("cwebster.utils").map

-- mapping
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble"})
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", { desc = "lsp workspace"})
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagostics<cr>", { desc = "lsp document"})
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "quickfix"})
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "loclist"})

-- config

trouble.setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  action_keys = {
    previous = "e",
    next = "n"
  },
  auto_open = false,
  auto_close = false,
  use_diagnostic_signs = true
}
