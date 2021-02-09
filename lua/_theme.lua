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

-- my overrides over any ColorScheme
local my_clear_colors = {'SignColumn', 'SpellBad', 'SpellCap'}
local my_colors = {
  --Normal =                {ctermbg='NONE',                  guibg='NONE'},
  VertSplit =             {ctermbg='NONE',                  guibg='NONE'},
  PMenu =                 {ctermbg='Black',                 guibg='#191919'},
  PMenuSel =              {                guifg='#ffffff', guibg='#333333'},
  GitGutterAdd =          {ctermbg='NONE', ctermfg='green', guibg='NONE', guifg='green'},
  GitGutterChange =       {ctermbg='NONE', ctermfg='green', guibg='NONE', guifg='#2B5B77'},
  GitGutterDelete =       {ctermbg='NONE', ctermfg='red',   guibg='NONE', guifg='red'},
  GitGutterChangeDelete = {ctermbg='NONE', ctermfg='red',   guibg='NONE', guifg='#2B5B77'},
  SpellCap =              {guibg='NONE', guisp='Red', gui='undercurl', cterm='undercurl,bold'},
  SpellBad =              {guisp='Red', gui='undercurl', guibg='#771c13', cterm='undercurl,bold'},
  ALEErrorSign =          {ctermbg='NONE', ctermfg='red',   guibg='NONE', guifg='red'},
  ALEWarningSign =        {ctermbg='NONE', ctermfg='yellow', guibg='NONE', guifg='yellow'},
  ALEInfoSign =           {ctermbg='NONE', ctermfg='blue',  guibg='NONE', guifg='blue'},
  ALEHintSign =           {ctermbg='NONE', ctermfg='green', guibg='NONE', guifg='green'},
  TSCurrentScope =        {ctermbg='NONE',                  guibg='NONE'},
  QuickScopePrimary =     {guifg='#afff5f', gui='underline'},
  QuickScopeSecondary =   {guifg='#5fffff', gui='underline'},
}

-- this sets colors and sets up an autocmd to set them again if colo is changed
local mycolors = function(clear_colors, set_colors)
  local highlights = {}

  for _, v in pairs(clear_colors) do
    table.insert(highlights, "highlight clear "..v)
  end
  for k,v in pairs(set_colors) do
    local highlight = "highlight "..k
    for attr, value in pairs(v) do
      highlight = highlight.." "..attr.."="..value
    end
    table.insert(highlights, highlight)
  end

  for _, c in pairs(highlights) do
    vim.api.nvim_command(c)
  end
  vim.api.nvim_command("augroup mycolors")
  for _, c in pairs(highlights) do
    vim.api.nvim_command("autocmd ColorScheme * "..c)
  end
  vim.api.nvim_command("augroup END")
end

mycolors(my_clear_colors, my_colors)

--"autocmd ColorScheme * highlight NvimTreeFolderIcon guibg=blue
