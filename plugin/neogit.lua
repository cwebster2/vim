vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
        telescopes = true,
      },
    })
  end,
})
