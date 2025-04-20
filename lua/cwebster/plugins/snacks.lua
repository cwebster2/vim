return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
      { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
            width = 0.6,
            height = 0.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 3,
            },
          })
        end,
      }
    },
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      terminal = {},
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      zen = { enabled = true },
      statuscolumn = {
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = true, -- "",
          git_hl = false,
        },
        git = {
          patterns = { "GitSign", "MinDiffSign" },
        },
        refresh = 50,
      },
    }
  },
}
