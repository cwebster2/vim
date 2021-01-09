augroup vimrc_tex
  autocmd!
  autocmd Filetype <buffer> set spell
  autocmd BufWritePost <buffer> silent! call Tex_CompileLatex()
augroup END
