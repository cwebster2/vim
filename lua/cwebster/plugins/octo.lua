return {
  {
    "pwntester/octo.nvim",
    dependencies = { "telescope.nvim" },
    config = function()
      require("octo").setup()
      require("telescope").load_extension("octo")
    end,
  },
}
