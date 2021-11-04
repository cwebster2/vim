local vim = vim
local cp_api = require("katppuccino.api.colors")
local cp_util = require("katppuccino.utils.util")
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
colors.fg = cp_util.lighten(colors.katppuccino0, 0.75)
colors.fg_gutter = colors.katppuccino12
colors.blue = colors.katppuccino3
colors.green = colors.katppuccino7
colors.none = "NONE"
colors.red = colors.katppuccino6
colors.yellow = colors.katppuccino8
colors.gray = colors.katppuccino12

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
    local catppuccino = require("katppuccino")
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
        -- ColorColumn = { fg = colors.none }
      })
    catppuccino.load("katppuccino")
  else
    vim.api.nvim_command("colorscheme "..scheme)
  end

end

M.overrides_setup = function()
  vim.cmd[["highlight! BufferTabpageFil guibg=none]]
  vim.cmd[["highlight! BufferlineBufferSelected gui=underline]]
  --"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
end

-- vim.g.bufferline = {
--   closable = false
-- }

return M

