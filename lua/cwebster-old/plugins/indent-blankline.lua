return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    opts = {
      indent = {
        highlight = "IndentBlanklineChar",
        char = "▏",
      },
      scope = {
        highlight = "IndentBlanklineContextChar",
      },
      -- show_end_of_line = false,
      -- context_char_list = { "▏"},
      -- show_current_context_start = true,
      -- show_trailing_blankline_indent = true,
      -- use_treesitter = true,
      -- use_treesitter_scope = true,
    },
  },
}
