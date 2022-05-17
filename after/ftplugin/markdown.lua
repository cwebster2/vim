vim.api.nvim_win_set_option(0, "foldmethod", "expr")
vim.api.nvim_buf_set_option(0, "textwidth", 80)
vim.api.nvim_win_set_option(0, "colorcolumn", "81")
vim.api.nvim_buf_set_option(0, "wrapmargin", 0)
vim.api.nvim_win_set_option(0, "spell", true)

vim.cmd[[
  setlocal fo-=t

  " Disable hidden char due to indentLine plugin
  setlocal conceallevel=0
  let g:indentLine_concealcursor = 'invc'
  let g:indentLine_conceallevel = 2
]]

