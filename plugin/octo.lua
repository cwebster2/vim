vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    require("octo").setup()
    require("telescope").load_extension("octo")
  end,
})
