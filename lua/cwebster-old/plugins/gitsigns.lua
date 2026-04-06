return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-scrollbar",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        changedelete = { text = "▋" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true })

        -- Actions
        map("n", "<leader>ghs", gs.stage_hunk)
        map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>ghs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("v", "<leader>ghr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end)
        map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame line" })
        map("n", "<leader>gtb", gs.toggle_current_line_blame, { desc = "Toggle Blame Line" })
        map("n", "<leader>ghd", gs.diffthis)
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end)
        map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle Deleted" })
      end,
      watch_gitdir = {
        interval = 1000,
      },
      current_line_blame = true,
      diff_opts = {
        internal = true, -- If luajit is present
      },
    },
    config = function(plugin)
      require("gitsigns").setup(plugin.opts)
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
}
