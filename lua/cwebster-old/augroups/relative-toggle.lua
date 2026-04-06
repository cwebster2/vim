local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}, {
  callback = function()
    if vim.opt.number:get() then
      vim.opt.relativenumber = true
    end
  end,
  group = numbertoggle,
  pattern = '*',
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}, {
  callback = function()
    if vim.opt.number:get() then
      vim.opt.relativenumber = false
    end
  end,
  group = numbertoggle,
  pattern = '*',
})

