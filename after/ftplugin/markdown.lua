vim.opt_local.foldmethod = "expr"
vim.opt_local.textwidth = 80
vim.opt_local.colorcolumn = "81"
vim.opt_local.wrapmargin = 0
vim.opt_local.spell = true

-- vim.opt_local.formatoptions = vim.opt.formatoptions -"t"
vim.opt_local.conceallevel = 2
-- vim.cmd[[
--   " Disable hidden char due to indentLine plugin
--   let g:indentLine_concealcursor = 'invc'
--   let g:indentLine_conceallevel = 2
--   if &readonly || &buftype =~ 'nofile'
--     setlocal conceallevel=2
--   else
--     setlocal conceallevel=0
--   endif
-- ]]
