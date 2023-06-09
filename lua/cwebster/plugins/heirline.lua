return {
  {
    "rebelot/heirline.nvim",
    -- event = "VeryLazy", -- this is breaking the winbar
    config = function()
      require("cwebster.heirline").setup()
    end,
  },
}
