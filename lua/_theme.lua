local vim = vim
local M = {}

local c = {
  none = "NONE",
  changed = "#2B5B77",
  lspvtext = "#555555",
  cursorline = '#1c1c1c',
  modified = 'DarkGoldenrod2',
  indentguides = '#222222',
  indentguidescurrent = '#555555',
  whitespace = '#333333',
  diffadd = 'green',
  diffdel = 'red',
  diffchanged = "#2B5B77",

  bg = '#282c34',
  --line_bg = '#353644',
  line_bg = '#1c1c1c',
  fg = '#8FBCBB',
  fg_green = '#65a380',

  bg_none = "NONE",

  --red = "red",
  --green = "green",
  gray = 'gray',

  yellow = '#fabd2f',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#afd700',
  orange = '#FF8800',
  purple = '#5d4d7a',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',

  normalmode = '#99ad6a'
}

M.galaxyline_colors = c

M.mode_color = {
  --n = 'DarkGoldenrod2',
  n = c.fg_green,
  i = c.blue,
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
  scheme = scheme or "jellybeans"

  vim.api.nvim_command [[syntax on]]
  if vim.fn.has('termguicolors') == 1 then
    vim.cmd[[set termguicolors]]
  end

  vim.o.background = "dark"

  vim.g.jellybeans_use_term_italics = 1
  vim.g.jellybeans_overrides = {
    background = {
      ctermbg = 'none',
      guibg = 'none'
    },
  }

  vim.g.sonokai_style = 'shusia'
  vim.g.sonokai_transparent_background = 1
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_disable_italic_comment = 1

  vim.g.nightflyCursorColor = 1
  vim.g.nightflyUnderlineMatchParen = 1
  vim.g.nightflyUndercurls = 1
  vim.g.nightflyCursorColor = 1
  vim.g.nightflyTransparent = 1

  vim.api.nvim_command("colorscheme "..scheme)
end

M.overrides_setup = function()
  vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "ALEErrorSign"})
  vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠", texthl = "ALEWarningSign"})
  vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "ALEInfoSign"})
  vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "ALEHintSign"})

  -- my overrides over any ColorScheme
  local my_clear_colors = {'SignColumn', 'SpellBad', 'SpellCap'}
  local my_colors = {
    Normal =                {ctermbg=c.none,                  guibg=c.none},
    VertSplit =             {ctermbg=c.none,                  guibg=c.none},
    IndentGuides =          {ctermbg=c.none, guibg=c.none, guifg=c.indentguides},
    Whitespace =            {ctermbg=c.none, guibg=c.none, guifg=c.whitespace},
    NonText =               {ctermbg=c.none, guibg=c.none, guifg=c.whitespace},
    LineNr =                {ctermbg=c.none,                  guibg=c.none},
    Folded =                {ctermbg=c.none,                  guibg=c.none},
    SpecialKey =            {ctermbg=c.none,                  guibg=c.none},
    SignColumn =            {ctermbg=c.none,                  guibg=c.none},
    EndOfBuffer =           {ctermbg=c.none, guifg='#222222', guibg=c.none},
    WhichKeyFloat =         {ctermbg='Black',                 guibg='#191919', blend=30},
    PMenu =                 {ctermbg='Black',                 guibg='#191919', blend=25},
    PMenuSel =              {                guifg='#ffffff', guibg='#333333'},
    CursorLine =            { guibg='#191919', blend=50 },
    IndentBlankLineContextChar = {guibg=c.none, guifg=c.indentguidescurrent, gui='nocombine'},
    GitGutterAdd =          {ctermbg=c.none, ctermfg='green', guibg=c.none, guifg='green'},
    GitGutterChange =       {ctermbg=c.none, ctermfg='green', guibg=c.none, guifg=c.diffchanged},
    GitGutterDelete =       {ctermbg=c.none, ctermfg='red',   guibg=c.none, guifg=c.red},
    GitGutterChangeDelete = {ctermbg=c.none, ctermfg='red',   guibg=c.none, guifg=c.diffchanged},
    SpellCap =              {guibg=c.none, guisp='Red', gui='undercurl', cterm='undercurl,bold'},
    SpellBad =              {guisp='Red', gui='undercurl', guibg='#771c13', cterm='undercurl,bold'},
    ALEErrorSign =          {ctermbg=c.none, ctermfg='red',   guibg=c.none, guifg='red'},
    ALEWarningSign =        {ctermbg=c.none, ctermfg='yellow', guibg=c.none, guifg='yellow'},
    ALEInfoSign =           {ctermbg=c.none, ctermfg='blue',  guibg=c.none, guifg='blue'},
    ALEHintSign =           {ctermbg=c.none, ctermfg='green', guibg=c.none, guifg='green'},
    TSCurrentScope =        {ctermbg=c.none,                  guibg=c.none},
    QuickScopePrimary =     {guifg='#afff5f', gui='underline'},
    QuickScopeSecondary =   {guifg='#5fffff', gui='underline'},
    LspDiagnosticsVirtualTextHint = {guifg=c.lspvtext},
    TSKeyword           =   {guifg='#8197bf', gui='italic'},
    BufferlineBufferSelected = {guifg='#000000', guibg='#f0f0f0', gui='underline'},
    BufferCurrent =    {guifg='#e8e8d3', guibg=c.none},
    BufferCurrentMod=    {guifg=c.modified, guibg=c.none},
    BufferCurrentSign =    {guifg='#799d6a', guibg=c.none},
    BufferCurrentTarget =    {guifg='red', guibg=c.none, gui='bold'},
    BufferVisible =    {guifg='white', guibg=c.none},
    BufferVisibleMod =    {guifg=c.modified, guibg=c.none},
    BufferVisibleSign =    {guifg='white', guibg=c.none},
    BufferVisibleTarget =    {guifg='red', guibg=c.none, gui='bold'},
    BufferInactive =    {guifg='#4C5966', guibg=c.none},
    BufferInactiveMod =    {guifg='#A59272', guibg=c.none},
    BufferInactiveSign =    {guifg='#606060', guibg=c.none},
    BufferInactiveTarget =    {guifg='red', guibg=c.none, gui='bold'},
    BufferTabpages =    {guifg=c.none, guibg=c.none},
    BufferTabpageFill =    {guifg=c.none, guibg=c.none},
    StatusLine = {guifg='gray', guibg=c.none, gui='italic'},
    LspDiagnosticsUnderlineHint = {gui='undercurl', guisp='lightgreen'},
    LspDiagnosticsUnderlineWarning = {gui='undercurl', guisp='yellow'},
    LspDiagnosticsUnderlineError = {gui='undercurl', guisp='red'},
    LspDiagnosticsUnderlineInfo = {gui='undercurl', guisp='blue'},
    LspDiagnosticsDefaultError = {guifg='gray'},
    NvimTreeRootFolder = {guifg='green'},
    NvimTreeGitDirty = {guifg=c.diffdel}
  }

  -- this sets colors and sets up an autocmd to set them again if colo is changed

  require'color-overrides'.set_overrides(my_clear_colors, my_colors)

  vim.cmd[["highlight! BufferTabpageFil guibg=none]]
  vim.cmd[["highlight! BufferlineBufferSelected gui=underline]]
  --"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
end

-- vim.g.bufferline = {
--   closable = false
-- }

return M

