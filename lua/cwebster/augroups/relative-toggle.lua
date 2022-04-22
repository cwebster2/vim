local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

for _, autocmd in pairs({"BufEnter", "FocusGained", "InsertLeave", "WinEnter"}) do
  vim.api.nvim_create_autocmd(autocmd, {
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = true
      end
    end,
    group = numbertoggle,
    pattern = '*',
  })
end

for _, autocmd in pairs({"BufLeave", "FocusLost", "InsertEnter", "WinLeave"}) do
  vim.api.nvim_create_autocmd(autocmd, {
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = false
      end
    end,
    group = numbertoggle,
    pattern = '*',
  })
end

