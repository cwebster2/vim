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
      to_clipboard = true,
    },
  },
}
