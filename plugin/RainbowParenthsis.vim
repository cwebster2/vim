" this is a simple script. it extends the syntax highlighting to
" highlight each matching set of parens in different colors, to make
" it visually obvious what matches which.

" Obviously, most useful when working with lisp. But it's also nice othe
" times.

" I don't intend to maintain this script. I hacked it together for my
" own purposes, and it is sufficient to the day. If you want to improve it,
" knock yourself out.

" This file is public domain.


" define colors. Note that the one numbered '16' is the outermost pair,
" keep that in mind if you want to change the colors.
" Also, if this script doesn't work on your terminal, you may need to add
" guifg=xx or ever termfg=, though what good this script will do on a 
" black and white terminal I don't know.
" Parens
hi level11c ctermfg=blue
hi level12c ctermfg=magenta
hi level13c ctermfg=brown
hi level14c ctermfg=red
hi level15c ctermfg=green
hi level16c cterm=bold ctermfg=27

" Brackets
hi clevel10c ctermfg=cyan
hi clevel11c ctermfg=yellow
hi clevel12c ctermfg=brown
hi clevel13c ctermfg=206
hi clevel14c ctermfg=magenta
hi clevel15c ctermfg=red
hi clevel16c cterm=bold ctermfg=28

" Braces
hi blevel10c ctermfg=green
hi blevel11c ctermfg=yellow
hi blevel12c ctermfg=magenta
hi blevel13c ctermfg=red
hi blevel14c ctermfg=206
hi blevel15c ctermfg=cyan
hi blevel16c cterm=bold ctermfg=brown


" These are the regions for each pair.
" This could be improved, perhaps, by makeing them match [ and { also,
" but I'm not going to take the time to figure out haw to make the
" end pattern match only the proper type.
syn region level1 matchgroup=level1c start=/(/ end=/)/ contains=TOP,level1,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level2 matchgroup=level2c start=/(/ end=/)/ contains=TOP,level2,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level3 matchgroup=level3c start=/(/ end=/)/ contains=TOP,level3,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level4 matchgroup=level4c start=/(/ end=/)/ contains=TOP,level4,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level5 matchgroup=level5c start=/(/ end=/)/ contains=TOP,level5,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level6 matchgroup=level6c start=/(/ end=/)/ contains=TOP,level6,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level7 matchgroup=level7c start=/(/ end=/)/ contains=TOP,level7,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level8 matchgroup=level8c start=/(/ end=/)/ contains=TOP,level8,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level9 matchgroup=level9c start=/(/ end=/)/ contains=TOP,level9,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level10 matchgroup=level10c start=/(/ end=/)/ contains=TOP,level10,level11,level12,level13,level14,level15, level16,NoInParens
syn region level11 matchgroup=level11c start=/(/ end=/)/ contains=TOP,level11,level12,level13,level14,level15, level16,NoInParens
syn region level12 matchgroup=level12c start=/(/ end=/)/ contains=TOP,level12,level13,level14,level15, level16,NoInParens
syn region level13 matchgroup=level13c start=/(/ end=/)/ contains=TOP,level13,level14,level15, level16,NoInParens
syn region level14 matchgroup=level14c start=/(/ end=/)/ contains=TOP,level14,level15, level16,NoInParens
syn region level15 matchgroup=level15c start=/(/ end=/)/ contains=TOP,level15, level16,NoInParens
syn region level16 matchgroup=level16c start=/(/ end=/)/ contains=TOP,level16,NoInParens

syn region blevel1 matchgroup=clevel1c start=/\[/ end=/\]/ contains=TOP,blevel1,blevel2,blevel3,blevel4,blevel5,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel2 matchgroup=clevel2c start=/\[/ end=/\]/ contains=TOP,blevel2,blevel3,blevel4,blevel5,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel3 matchgroup=clevel3c start=/\[/ end=/\]/ contains=TOP,blevel3,blevel4,blevel5,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel4 matchgroup=clevel4c start=/\[/ end=/\]/ contains=TOP,blevel4,blevel5,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel5 matchgroup=clevel5c start=/\[/ end=/\]/ contains=TOP,blevel5,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel6 matchgroup=clevel6c start=/\[/ end=/\]/ contains=TOP,blevel6,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel7 matchgroup=clevel7c start=/\[/ end=/\]/ contains=TOP,blevel7,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel8 matchgroup=clevel8c start=/\[/ end=/\]/ contains=TOP,blevel8,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel9 matchgroup=clevel9c start=/\[/ end=/\]/ contains=TOP,blevel9,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel10 matchgroup=clevel10c start=/\[/ end=/\]/ contains=TOP,blevel10,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel11 matchgroup=clevel11c start=/\[/ end=/\]/ contains=TOP,blevel11,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel12 matchgroup=clevel12c start=/\[/ end=/\]/ contains=TOP,blevel12,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel13 matchgroup=clevel13c start=/\[/ end=/\]/ contains=TOP,blevel13,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel14 matchgroup=clevel14c start=/\[/ end=/\]/ contains=TOP,blevel14,blevel15, blevel16,NoInBrackets
syn region blevel15 matchgroup=clevel15c start=/\[/ end=/\]/ contains=TOP,blevel15, blevel16,NoInBrackets
syn region blevel16 matchgroup=clevel16c start=/\[/ end=/\]/ contains=TOP,blevel16,NoInBrackets

syn region clevel1 matchgroup=blevel1c start=/{/ end=/}/ contains=TOP,clevel1,clevel2,clevel3,clevel4,clevel5,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel2 matchgroup=blevel2c start=/{/ end=/}/ contains=TOP,clevel2,clevel3,clevel4,clevel5,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel3 matchgroup=blevel3c start=/{/ end=/}/ contains=TOP,clevel3,clevel4,clevel5,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel4 matchgroup=blevel4c start=/{/ end=/}/ contains=TOP,clevel4,clevel5,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel5 matchgroup=blevel5c start=/{/ end=/}/ contains=TOP,clevel5,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel6 matchgroup=blevel6c start=/{/ end=/}/ contains=TOP,clevel6,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel7 matchgroup=blevel7c start=/{/ end=/}/ contains=TOP,clevel7,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel8 matchgroup=blevel8c start=/{/ end=/}/ contains=TOP,clevel8,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel9 matchgroup=blevel9c start=/{/ end=/}/ contains=TOP,clevel9,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel10 matchgroup=blevel10c start=/{/ end=/}/ contains=TOP,clevel10,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel11 matchgroup=blevel11c start=/{/ end=/}/ contains=TOP,clevel11,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel12 matchgroup=blevel12c start=/{/ end=/}/ contains=TOP,clevel12,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel13 matchgroup=blevel13c start=/{/ end=/}/ contains=TOP,clevel13,clevel14,clevel15, clevel16,NoInBraces
syn region clevel14 matchgroup=blevel14c start=/{/ end=/}/ contains=TOP,clevel14,clevel15, clevel16,NoInBraces
syn region clevel15 matchgroup=blevel15c start=/{/ end=/}/ contains=TOP,clevel15, clevel16,NoInBraces
syn region clevel16 matchgroup=blevel16c start=/{/ end=/}/ contains=TOP,clevel16,NoInBraces
