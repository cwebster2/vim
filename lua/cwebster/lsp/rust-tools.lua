require('rust-tools').setup({
  tools = { -- rust-tools options
    autoSetHints = true,

    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "<-",
      other_hints_prefix  = "=>",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
    },

    hover_actions = {
      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      auto_focus = true,
      border = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"}
      },
    },

    -- runnables = { use_telescope = true }
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = require('cwebster.lsp').get_server_config()
})

