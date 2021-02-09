vim.g.jellybeans_overrides = {
  background = {
    ctermbg = 'none',
    guibg = 'none'
  },
}

vim.api.nvim_command [[syntax on]]
vim.o.background = "dark"
vim.g.jellybeans_use_term_italics = 1

vim.api.nvim_command("colorscheme jellybeans")
--vim.api.nvim_command("colorscheme zephyr")

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "ALEErrorSign"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠", texthl = "ALEWarningSign"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "ALEInfoSign"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "ALEHintSign"})

local c = {
  none = "NONE",
  red = "red",
  green = "green",
  changed = "#2B5B77",
}

-- my overrides over any ColorScheme
local my_clear_colors = {'SignColumn', 'SpellBad', 'SpellCap'}
local my_colors = {
  --Normal =                {ctermbg='NONE',                  guibg='NONE'},
  VertSplit =             {ctermbg=c.none,                  guibg=c.none},
  PMenu =                 {ctermbg='Black',                 guibg='#191919'},
  PMenuSel =              {                guifg='#ffffff', guibg='#333333'},
  GitGutterAdd =          {ctermbg=c.none, ctermfg=c.green, guibg=c.none, guifg=c.green},
  GitGutterChange =       {ctermbg=c.none, ctermfg=c.green, guibg=c.none, guifg=c.changed},
  GitGutterDelete =       {ctermbg=c.none, ctermfg=c.red,   guibg=c.none, guifg=c.red},
  GitGutterChangeDelete = {ctermbg=c.none, ctermfg=c.red,   guibg=c.none, guifg=c.changed},
  SpellCap =              {guibg=c.none, guisp='Red', gui='undercurl', cterm='undercurl,bold'},
  SpellBad =              {guisp='Red', gui='undercurl', guibg='#771c13', cterm='undercurl,bold'},
  ALEErrorSign =          {ctermbg=c.none, ctermfg='red',   guibg=c.none, guifg='red'},
  ALEWarningSign =        {ctermbg=c.none, ctermfg='yellow', guibg=c.none, guifg='yellow'},
  ALEInfoSign =           {ctermbg=c.none, ctermfg='blue',  guibg=c.none, guifg='blue'},
  ALEHintSign =           {ctermbg=c.none, ctermfg='green', guibg=c.none, guifg='green'},
  TSCurrentScope =        {ctermbg=c.none,                  guibg=c.none},
  QuickScopePrimary =     {guifg='#afff5f', gui='underline'},
  QuickScopeSecondary =   {guifg='#5fffff', gui='underline'},
}

-- this sets colors and sets up an autocmd to set them again if colo is changed

require'color-overrides'.set_overrides(my_clear_colors, my_colors)

--"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
