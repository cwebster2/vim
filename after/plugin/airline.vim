let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#denite#enabled = 1
let g:airline#extensions#fugutive#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=1
let g:airline_exclude_preview = 1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#syntastic#enabled=1
"let g:airline_theme='simple'
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_format = {
  \ '0': ' ',
  \ '1': '➊ ',
  \ '2': '➋ ',
  \ '3': '➌ ',
  \ '4': '➍ ',
  \ '5': '➎ ',
  \ '6': '➏ ',
  \ '7': '➐ ',
  \ '8': '➑ ',
  \ '9': '➒ '
  \}
