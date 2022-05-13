local M = {}
local lint = require("lint")

function M.setup()
  lint.linters_by_ft = {
    text = {'vale',},
    markdown = {'vale',},
    rst = {'vale',},
    dockerfile = {'hadolint',},
    javascript = { 'eslint', },
    typescript = { 'eslint', },
    vue = { 'eslint', },
    svelte = { 'eslint', },
    json = { 'eslint', },
    yaml = { 'eslint', },
    toml = { 'eslint', },
    sh = { 'shellcheck' },
    bash = { 'shellcheck' },
  }
end

local nvimlintag = vim.api.nvim_create_augroup("autolint", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "<buffer>", group = nvimlintag, callback = function() lint.try_lint() end})

return M

