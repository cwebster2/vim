augroup vimrc_tex
  autocmd!
  autocmd Filetype <buffer> set spell
  autocmd Filetype <buffer> nnoremap <silent> <F2> :silent make\|redraw!\|cw<CR>
  autocmd BufWritePost <buffer> <F2>
augroup END
