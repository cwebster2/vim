local vim = vim
local g = vim.g
local tn_colors = require("tokyonight.colors")

local M = {}

local tokyonight_options = {
  style = "night",
  transparent = true,
  commmentStyle = "italic",
  keywordStyle = "italic",
  functionStyle = "italic",
  variableStyle = "NONE",
  hideInactiveStatusline = false,
  terminalColors = true,
  sidebars = {},
  colors = {},
  dev = false,
  darkFloat = true,
  darkSidebar = true,
  transparentSidebar = false,
  transform_colors = {},
  lualineBold = false,
}

local colors = tn_colors.setup(tokyonight_options)

-- colors.diff = {
--   add = 'green',
--   change = "#2B5B77",
--   delete = 'red',
--   remove = 'red',
-- }
-- colors.neogit = {
--   addbg = "#012800",
--   delbg = "#340001",
-- }
-- colors.fg = cp_util.lighten(colors.catppuccin0, 0.75)
-- colors.fg_gutter = colors.catppuccin12
-- colors.blue = colors.catppuccin3
-- colors.green = colors.catppuccin7
-- colors.none = "NONE"
-- colors.red = colors.catppuccin6
-- colors.yellow = colors.catppuccin8
-- colors.gray = colors.catppuccin12
-- colors.white_br = "#FDEBC3"

M.galaxyline_colors = colors

M.load = function()

  vim.api.nvim_command [[syntax on]]
  if vim.fn.has('termguicolors') == 1 then
    vim.cmd[[set termguicolors]]
  end

  vim.o.background = "dark"

  local colors = tokyonight.setup(tokyonight_options)
    -- catppuccino.remap({
    --   --   fg = colors.fg
    --     PMenu = { blend=25 },
    --     CursorLine = { blend=50 },
    --     GitSignsAdd = { fg = colors.diff.add, bg = colors.none },
    --     GitSignsChange = { fg = colors.diff.change, bg = colors.none },
    --     GitSignsDelete = { fg = colors.diff.delete, bg = colors.none },
    --     NeogitDiffDeleteHighlight = { bg = colors.neogit.delbg, fg=colors.fg },
    --     NeogitDiffAddHighlight = { bg = colors.neogit.addbg, fg=colors.fg },
    --     NeogitDiffContextHighlight = { bg = colors.none },
    --     GalaxyLineFillSection = { bg = colors.none },
    --     CmpItemKind = { fg = colors.catppuccin2 },
    --     CmpItemMenu = { fg = colors.catppuccin8 },
    --     MsgArea = { fg = colors.white_br },
    --     BufferlineBufferSelected = { style = "underline" },
    --     BufferTabpageFil = { bg = colors.none },
    --     -- LspReference = { bg = colors.catppuccin4 }
    --     -- ColorColumn = { fg = colors.none }
    --   })
  vim.api.nvim_command("colorscheme tokyonight")

end

return M

