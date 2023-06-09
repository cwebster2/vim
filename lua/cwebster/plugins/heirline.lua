return {
  {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    depedencies = {
      "catppuccin/nvim",
      "nvim-web-devicons",
    },
    config = function()
      require("cwebster.heirline").setup()
    end,
  },
}
