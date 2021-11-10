local M = {}
local catppuccino = require("cwebster.colors.catppuccino")
local tokyonight = require("cwebster.colors.tokyonight")

local vim = vim

local colors = catppuccino.colors
-- local colors = tokyonight.colors

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

M.setup = function(scheme)
  scheme = scheme or "catppuccino"
  if scheme == "catppuccino" then
    require("cwebster.colors.catppuccino").load()
  elseif scheme == "tokyonight" then
    require("cwebster.colors.tokyonight").load()
  else
    vim.api.nvim_command("colorscheme "..scheme)
  end

end

-- vim.g.bufferline = {
--   closable = false
-- }

return M

