return {
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
        documentation = {
          opts = {
            lang = "markdown",
          },
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
      },
    },
  },
}
