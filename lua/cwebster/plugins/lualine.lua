return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      globalstatus = true,
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1, symbols = { modified = "●" } } },
        lualine_x = {
          -- "encoding",
          -- "fileformat",
          { "filetype", icon_only = true },
          "lsp_status",
        },
        lualine_y = { "searchcount", "progress" },
        lualine_z = { "location" },
      },
      extensions = { "oil", "man", "lazy" },
    },
  },
}
-- 478
