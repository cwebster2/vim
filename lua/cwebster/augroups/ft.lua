local autogroup_main = vim.api.nvim_create_augroup("myfiletype", { clear = true })

local fileTypeAucmds = {
  {
    pattern = "markdown,txt",
    callback = function()
        vim.opt.spell = true
        -- vim.api.nvim_win_set_option(0, "spell", true)
    end,
    group = autogroup_main,
  },
}

for _, opt_tbl in pairs(fileTypeAucmds) do
    vim.api.nvim_create_autocmd("FileType", opt_tbl)
end
