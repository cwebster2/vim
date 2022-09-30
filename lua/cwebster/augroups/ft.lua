local autogroup_ft = vim.api.nvim_create_augroup("myfiletype", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"markdown", "txt"},
    command= "setlocal spell",
    -- callback = function()
    --     vim.api.nvim_win_set_option(0, "spell", true)
    -- end,
    group = autogroup_ft
  }
)
