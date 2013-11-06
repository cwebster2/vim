source ~/.vim/colors/leo.vim

" Remove some annoying highlights
hi Normal guibg=#080808
hi VertSplit ctermfg=233 ctermbg=233
hi StatusLine ctermfg=255 ctermbg=233
hi StatusLineNC ctermfg=255 ctermbg=233
hi NonText ctermfg=236 guifg=#303030
hi Comment ctermfg=243 guifg=#767676
hi CursorLine ctermbg=235
hi String ctermbg=NONE guibg=NONE
hi Special ctermbg=NONE guibg=NONE
hi SpecialKey ctermbg=NONE guibg=NONE
hi AlmostOver ctermbg=233
hi OverLength ctermbg=234
hi Underlined cterm=NONE guibg=NONE

" Properly highlight matching paren
hi MatchParen cterm=NONE ctermbg=20 ctermfg=NONE

" Highlight tree directory slash correctly
hi link treeDirSlash Function
