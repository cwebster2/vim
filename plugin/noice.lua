require("noice").setup({
  -- popupmenu = {
  --   backend = "nui",
  -- },
  presets = {
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
  messages = {
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
  },
  lsp = {
    override = {
      ["vim.lsp.util.stylize_markdown"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = 2,
        col = "50%",
      },
      size = {
        height = "auto",
        width = 60,
      },
      -- border = {
      --  style = "none",
      --  padding = { 2, 3 },
      -- },
      filter_options = {},
    },
    hover = {
      border = {
        style = "rounded",
        -- padding = { 2, 3 },
      },
      position = { row = 2, col = 0 },
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "cmdline",
        find = "^%s*[/?]",
      },
      view = "cmdline",
    },
    {
      filter = {
        event = "msg_show",
        kind = "search_count",
      },
      opts = { skip = true },
    },
  }
})

