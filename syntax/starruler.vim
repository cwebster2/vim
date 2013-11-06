" Vim syntax file for star ruler data files

" Check whether syntax has been loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
let b:current_syntax = "starruler"

syn case ignore
syn match srKey "\s[^v].*:\(\s\|$\)"
syn match srUserKey "\sv.*:\(\s\|$\)"
syn match srHeading "\(System\):"
syn match srTechLevel "Techs\.[^\.]*\.Level"
syn match srValue "\[[^\]]*\]"
syn match srStatement "As Level$"
syn keyword srVar Scale Object with Size
syn keyword srConst LEVEL_GAIN_CURVE HEALTH_CURVE HEALTH_MULT GAME_DAMAGE_MULT
syn match srOperator "\(+\|-\|\*\|>\|<\|==\|>=\|<=\|&&\|||\)"
syn keyword srFunc floor pow max min decay poly sqrt progress
syn match srComment "//.*"

hi link srVar Special
hi link srUserKey Identifier
hi link srKey Statement
hi link srHeading Function
hi link srConst Define
hi link srTechLevel Number
hi link srValue String
hi link srStatement Special
hi link srOperator Operator
hi link srComment Comment
