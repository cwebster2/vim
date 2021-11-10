local vim = vim
local cp_api = require("catppuccin.api.colors")
local cp_util = require("catppuccin.utils.util")
local M = {}
local catppuccino_theme = "dark_katppuccino"

local colors = cp_api.get_colors()
colors.diff = {
  add = 'green',
  change = "#2B5B77",
  delete = 'red',
  remove = 'red',
}
colors.neogit = {
  addbg = "#012800",
  delbg = "#340001",
}
colors.fg = cp_util.lighten(colors.catppuccin0, 0.75)
colors.fg_gutter = colors.catppuccin12
colors.blue = colors.catppuccin3
colors.green = colors.catppuccin7
colors.none = "NONE"
colors.red = colors.catppuccin6
colors.yellow = colors.catppuccin8
colors.gray = colors.catppuccin12
colors.white_br = "#FDEBC3"

M.galaxyline_colors = colors

M.mode_color = {
  --n = 'DarkGoldenrod2',
  n = colors.green,
  i = colors.blue,
  v = 'gray',
  [""] = 'gray',
  V = 'gray',
  c = 'plum3',
  no = 'DarkGoldenrod2',
  s = 'SkyBlue2',
  S = 'SkyBlue2',
  [""] = 'SkyBlue2',
  ic = 'chartreuse3',
  R = 'purple',
  Rv = 'purple',
  cv = 'plum3',
  ce = 'plum3',
  r = 'chocolate',
  rm = 'chocolate',
  ["r?"] = 'chocolate',
  ["!"] = 'plum3',
  t = 'plum3'
}

M.colorscheme_setup = function(scheme)
  scheme = scheme or "katppuccino"

  vim.api.nvim_command [[syntax on]]
  if vim.fn.has('termguicolors') == 1 then
    vim.cmd[[set termguicolors]]
  end

  vim.o.background = "dark"

  local catppuccino_options = {
    colorscheme = catppuccino_theme,
      transparency = true,
      styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = "italic",
            hints = "italic",
            warnings = "italic",
            information = "italic",
          },
          underlines = {
            errors = "underline",
            hints = "underline",
            warnings = "underline",
            information = "underline",
          },
        },
        lsp_trouble = true,
        lsp_saga = true,
        gitsigns = true,
        telescope = true,
        cmp = true,
        nvimtree = {
          enabled = true,
          show_root = true,
        },
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        bufferline = true,
        markdown = true,
    }
  }

  if scheme == "katppuccino" then
    local catppuccino = require("catppuccin")
    catppuccino.setup(catppuccino_options)
    catppuccino.remap({
      --   fg = colors.fg
        PMenu = { blend=25 },
        CursorLine = { blend=50 },
        GitSignsAdd = { fg = colors.diff.add, bg = colors.none },
        GitSignsChange = { fg = colors.diff.change, bg = colors.none },
        GitSignsDelete = { fg = colors.diff.delete, bg = colors.none },
        NeogitDiffDeleteHighlight = { bg = colors.neogit.delbg, fg=colors.fg },
        NeogitDiffAddHighlight = { bg = colors.neogit.addbg, fg=colors.fg },
        NeogitDiffContextHighlight = { bg = colors.none },
        GalaxyLineFillSection = { bg = colors.none },
        CmpItemKind = { fg = colors.catppuccin2 },
        CmpItemMenu = { fg = colors.catppuccin8 },
        MsgArea = { fg = colors.white_br },
        BufferlineBufferSelected = { style = "underline" },
        BufferTabpageFil = { bg = colors.none },
        -- LspReference = { bg = colors.catppuccin4 }
        -- ColorColumn = { fg = colors.none }
      })
    catppuccino.load("catppuccin")
  else
    vim.api.nvim_command("colorscheme "..scheme)
  end

end

-- vim.g.bufferline = {
--   closable = false
-- }

return M

