vim.g.jellybeans_overrides = {
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
}

vim.o.background = "dark"
vim.g.jellybeans_use_term_italics = 1

vim.api.nvim_command("colorscheme jellybeans")

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "ALEErrorSign"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠", texthl = "ALEWarningSign"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "ALEInfoSign"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "ALEHintSign"})

vim.api.nvim_exec([[
augroup colors
autocmd ColorScheme * highlight PMenu ctermbg=Black guibg=#191919
autocmd ColorScheme * highlight PMenuSel guifg=#ffffff guibg=#333333
autocmd ColorScheme * highlight clear SignColumn
autocmd ColorScheme * highlight GitGutterAdd ctermbg=NONE ctermfg=green guibg=NONE guifg=green
autocmd ColorScheme * highlight GitGutterChange ctermbg=NONE ctermfg=green guibg=NONE guifg=#2B5B77
autocmd ColorScheme * highlight GitGutterDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=red
autocmd ColorScheme * highlight GitGutterChangeDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=#2B5B77
autocmd ColorScheme * highlight clear SpellCap
autocmd ColorScheme * highlight clear SpellBad
autocmd ColorScheme * highlight SpellCap guibg=NONE guisp='Red' gui=undercurl cterm=undercurl,bold
autocmd ColorScheme * highlight SpellBad guibg=NONE guisp='Red' gui=undercurl guibg=#771c13 cterm=undercurl,bold
autocmd ColorScheme * highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
autocmd ColorScheme * highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
autocmd ColorScheme * highlight ALEInfoSign ctermbg=NONE ctermfg=blue guibg=NONE guifg=blue
autocmd ColorScheme * highlight ALEHintSign ctermbg=NONE ctermfg=green guibg=NONE guifg=green
autocmd ColorScheme * highlight TSCurrentScope ctermbg=NONE guibg=NONE
"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
augroup END
]],
false
)
