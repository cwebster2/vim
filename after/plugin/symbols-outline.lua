local map = require("cwebster.utils").map

-- mappings
map("n", "<leader>fs", ":SymbolsOutline<CR>", { desc = "Symbols"})

--config
require("symbols-outline").setup({
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  width = 20,
  keymaps = {
      close = "<Esc>",
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      rename_symbol = "r",
      code_actions = "a",
      toggle_preview = "K",
  },
  lsp_blacklist = {},
})
