require("dropbar").setup()

local dropbar_api = require("dropbar.api")
vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
