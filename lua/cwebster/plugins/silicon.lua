return {
  {
    "krivahtoo/silicon.nvim",
    enabled = false,
    build = "./install.sh build",
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        watermark = {
          text = "@cwebster2",
        },
      })
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    opts = {
      font = "Hack Nerd Font Mono",
      -- theme = "catppuccin",
      no_window_controls = true,
      -- window_title = function()
      --   return vim.fn.fnamemodify(vim.api.nvim_buf_get_current_buf())
      -- end,
      to_clipboard = true,
    },
  },
}
