return {
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    dependencies = { "nvim-web-devicons" },
    keys = {
      { "<leader>bg", "<cmd>BufferLinePick<cr>", desc = "Goto Buffer" },
      { "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
      { "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<leader>bd", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Order by Dir" },
      { "<leader>bl", "<Cmd>BufferLineSortByDirectory<CR>", desc = "Order by Lang" },
      { "<leader>m", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
      { "<leader>i", "<Cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
    },
    opts = {
      options = {
        indicator = {
          style = "underline",
        },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
          -- remove extension from markdown files for example
          if buf.name:match("%.md") then
            return vim.fn.fnamemodify(buf.name, ":t:r")
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "(" .. count .. ")"
        end,
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", text_align = "center" },
          { filetype = "Outline", text = "Symbol Explorer", text_align = "center" },
        },
        color_icons = true,
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
      },
      highlights = {
        fill = {
          bg = "NONE",
          fg = "NONE",
        },
        background = {
          bg = "NONE",
        },
        buffer_selected = {
          bg = "NONE",
          italic = true,
          bold = true,
        },
      },
    },
    config = function(plugin)
      require("bufferline").setup(plugin.opts)
    end,
  },
}
