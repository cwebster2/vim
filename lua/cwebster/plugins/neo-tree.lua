return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols"
      },
      close_if_last_window = true,
      popup_border_style = "rounded",
      source_selector = {
        winbar = true,
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
    },
  },
}
