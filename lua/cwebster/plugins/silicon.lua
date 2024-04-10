return {
  "krivahtoo/silicon.nvim",
  build = "./install.sh build",
  cmd = "Silicon",
  config = function()
    require("silicon").setup({
      watermark = {
        text = "@cwebster2",
      },
    })
  end,
}
