local util = require("cwebster.utils")

util.map("n", "q", "<cmd>q<CR>", {noremap = true, silent = true})
vim.opt_local.winbar=nil
