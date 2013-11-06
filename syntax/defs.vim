" Vim syntax file for star ruler data files

" Check whether syntax has been loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
let b:current_syntax = "defs"

syn case ignore
syn match defKey "^\s*[^:]*:\(\s\|$\)"
syn match defComment "//.*"
syn match defBreak "\\n"
syn match defTag "#[^ #]*#"

hi link defComment Comment
hi link defKey Statement
hi link defBreak Function
hi link defTag PreProc
