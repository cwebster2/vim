return {
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    dependencies = { "kyazdani42/nvim-web-devicons" },
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

  {
    "rebelot/heirline.nvim",
    -- event = "VeryLazy", -- this is breaking the winbar
    config = function()
      require("cwebster.heirline").setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000",
        },
      },
    },
    keys = {
      -- stylua: ignore start
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline", },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message", },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History", },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All", },
      -- stylua: ignore end
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll forward",
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll backward",
      },
    },
    opts = {
      cmdline = {
        view = "cmdline_popup",
      },
      popupmenu = {
        backend = "cmp",
      },
      messages = {
        view = "mini",
      },
      lsp = {
        progress = {
          enabled = true,
        },
        override = {
          ["cmp.entry.get_documentation"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        },
        signature = {
          enabled = true,
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
      },
    },
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
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
