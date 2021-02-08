local a = vim.api
local g = vim.g

g.jellybeans_overrides = {
  background = {
    ctermbg = 'none',
    ["256ctermbg"] = 'none',
    guibg = 'none'
  },
  VertSplit = {
    ctermbg = 'none',
    guibg = 'none',
    ["256ctermbg"] = 'none',
  },
  SignColumn = {
    ctermbg = 'none',
    guibg = 'none',
    ["256ctermbg"] = 'none',
    ctermfg = 'none',
    guifg = 'none'
  },
  GitGutterAdd = {
    ctermbg = 'NONE',
    ctermfg = 'Green',
    guibg = 'NONE',
    guifg = '437019'
  },
  GitGutterChange = {
    ctermbg = 'NONE',
    ctermfg = 'green',
    guibg = 'NONE',
    guifg = '2B5B77'
  },
  GitGutterDelete = {
    ctermbg = 'NONE',
    ctermfg = 'red',
    guibg = 'NONE',
    guifg = '700009'
  },
  GitGutterChangeDelete = {
    ctermbg = 'NONE',
    ctermfg = 'red',
    guibg = 'NONE',
    guifg = '2B5B77'
  },
  PMenu = {
    ctermbg = 'black',
    guibg = '191919'
  },
  PMenuSel = {
    guifg = 'ffffff',
    guibg = '333333'
  },
  SpellCap = {
    guibg = 'NONE',
    guisp = '700009',
    attr =  'undercurl',
  },
  SpellBad = {
    guibg = 'none',
    attr =  'undercurl',
  },
  ALEErrorSign = {
     ctermbg='NONE',
     ctermfg='red',
     guibg='NONE',
     guifg='FF0000'
  },
  ALEWarningSign = {

     ctermbg='NONE',
     ctermfg='yellow',
     guibg='NONE',
     guifg='FFFF00'
  },
  ALEInfoSign = {

     ctermbg='NONE',
     ctermfg='blue',
     guibg='NONE',
     guifg='0000FF'
  },
  ALEHintSign = {

     ctermbg='NONE',
     ctermfg='green',
     guibg='NONE',
     guifg='00FF00'
  },
  LspDiagnosticsUnderlineError = {
    guifg = 'EB4917',
    attr = 'undercurl'
  },
  LspDiagnosticsUnderlineWarning = {
    guifg = 'EBA217',
    attr = 'undercurl'
  },
  LspDiagnosticsUnderlineInformation = {
    guifg = '17D6EB',
    attr = 'undercurl'
  },
  LspDiagnosticsUnderlineHint = {
    guifg = '17EB7A',
    attr = 'undercurl'
  },
  TSCurrentScope = {
     ctermbg='NONE',
     guibg='NONE',
  }
}
g.jellybeans_use_term_italics = 1

vim.api.nvim_command("colo jellybeans")

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "ALEErrorSign"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠", texthl = "ALEWarningSign"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "ALEInfoSign"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "ALEHintSign"})

