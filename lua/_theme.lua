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
}
g.jellybeans_use_term_italics = 1

--if vim.fn.has('termguicolors') == 1 then
--    g.jellybeans_overrides.background.guibg = 'none'
--end

vim.api.nvim_command("colo jellybeans")

a.nvim_command [[ hi PMenu ctermbg=Black guibg=#191919 ]]
a.nvim_command [[ hi PMenuSel guifg=#ffffff guibg=#333333 ]]
a.nvim_command [[ highlight clear SignColumn ]]
a.nvim_command [[ highlight GitGutterAdd ctermbg=NONE ctermfg=green guibg=NONE guifg=green ]]
a.nvim_command [[ highlight GitGutterChange ctermbg=NONE ctermfg=green guibg=NONE guifg=#2B5B77 ]]
a.nvim_command [[ highlight GitGutterDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=red ]]
a.nvim_command [[ highlight GitGutterChangeDelete ctermbg=NONE ctermfg=red guibg=NONE guifg=#2B5B77 ]]
a.nvim_command [[ highlight clear SpellCap ]]
a.nvim_command [[ highlight SpellCap guibg=NONE guisp='Red' gui=undercurl cterm=undercurl,bold ]]
a.nvim_command [[ highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red ]]
a.nvim_command [[ highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow ]]
a.nvim_command [[ highlight ALEInfoSign ctermbg=NONE ctermfg=blue guibg=NONE guifg=blue ]]
a.nvim_command [[ highlight ALEHintSign ctermbg=NONE ctermfg=green guibg=NONE guifg=green ]]
a.nvim_command [[ highlight TSCurrentScope ctermbg=NONE guibg=NONE ]]

vim.fn.sign_define("LspDiagnosticsSignError", {text = "✘", texthl = "ALEErrorSign"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "⚠", texthl = "ALEWarningSign"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "🛈", texthl = "ALEInfoSign"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "💡", texthl = "ALEHintSign"})

a.nvim_command [[ highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=undercurl ]]
a.nvim_command [[ highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=undercurl ]]
a.nvim_command [[ highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=undercurl ]]
a.nvim_command [[ highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=undercurl ]]
