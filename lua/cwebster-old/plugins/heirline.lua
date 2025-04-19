return {
  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    dependencies = {
      "catppuccin/nvim",
      "nvim-web-devicons",
    },
    config = function()
      require("cwebster.heirline").setup()
    end,
  },
}
