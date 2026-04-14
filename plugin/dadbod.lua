vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
})
