return {
  {
    "krivahtoo/silicon.nvim",
    enabled = true,
    build = "./install.sh build",
    cmd = "Silicon",
    config = function()
      require("silicon").setup({
        font = "Hack Nerd Font Mono=26",
        line_number = true,
        watermark = {
          text = "@cwebster2",
        },
      })
    end,
  },
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    enabled = false,
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
