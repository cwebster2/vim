local M = {}
local vim = vim

vim.g.catppuccin_flavour = "mocha"  -- latte, frappe, macchiato mocha
local colors = require("catppuccin.palettes").get_palette()

function M.get_colors()
  colors.diff = { -- git and native diffs
    add = "green",
    change = "#2B5B77",
    delete = "red",
    text = colors.blue,
    conflict = colors.magenta,
  }
  return colors
end

M.theme_colors = colors

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

M.setup = function()
  vim.api.nvim_command [[syntax on]]
  if vim.fn.has('termguicolors') == 1 then
    vim.cmd[[set termguicolors]]
  end

  require("cwebster.colors.catppuccin").setup()
  vim.cmd[[colorscheme catppuccin]]
end

return M

