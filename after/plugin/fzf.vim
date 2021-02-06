let g:fzf_command_prefix = 'F'
let g:fzf_buffers_jump = 1
let g:fzf_commands_expect = 'alt-enter'
" Set custom layout.
let g:fzf_layout = {
\ 'window': 'silent 18split enew'
\ }

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Set actions manually.
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-e': 'split',
\ 'ctrl-v': 'vsplit'
\ }

" History directory.
let g:fzf_history_dir = $HOME . '/.vim/cache/share/fzf/'

" Customize `fzf` colors to match current color scheme.
let g:fzf_colors = {
\ 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal'],
\ 'hl': ['fg', 'Comment'],
\ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+': ['fg', 'Statement'],
\ 'info': ['fg', 'Comment'],
\ 'border': ['fg', 'Ignore'],
\ 'prompt': ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker': ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header': ['fg', 'Comment']
\ }
nnoremap <silent> <C-p> :FGFiles<Enter>
nnoremap <silent> <Leader><C-p> :FLines<Enter>
nnoremap <silent> <C-f> :FAg<Enter>
nnoremap <silent> <M-x> :FCommands<Enter>
nnoremap <silent> <C-x><C-b> :FBuffers<Enter>
nnoremap <silent> <C-x><C-f> :FFiles<Enter>
command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))
