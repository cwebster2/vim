"denite
" Define mappings
augroup user_plugin_denite
  autocmd!

  autocmd FileType denite call s:denite_settings()
  autocmd FileType denite-filter call s:denite_filter_settings()
  autocmd User denite-preview call s:denite_preview()

"  autocmd VimResized * call s:denite_resize(g:denite_position)

  " Enable Denite special cursor-line highlight
  autocmd WinEnter * if &filetype =~# '^denite'
        \ |   highlight! link CursorLine WildMenu
        \ | endif

  " Disable Denite special cursor-line highlight
  autocmd WinLeave * if &filetype ==# 'denite'
        \ |   highlight! link CursorLine NONE
        \ | endif
augroup END

function! s:denite_settings() abort
  " Window options
  setlocal signcolumn=no cursorline

  " Denite selection window key mappings
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
  nnoremap <silent><buffer><expr> q    denite#do_map('quit')
  nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
  nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
  nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
  nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

" Denite-preview window settings
function! s:denite_preview() abort
  " Window options
  setlocal nocursorline colorcolumn= signcolumn=no nonumber nolist nospell

  if &lines > 35
    resize +8
  endif
  " let l:pos = win_screenpos(win_getid())
  " let l:heighten = &lines - l:pos[0]
  " execute 'resize ' . l:heighten

  " Clear indents
  if exists('*indent_guides#clear_matches')
    call indent_guides#clear_matches()
  endif
endfunction

" Denite-filter window settings
function! s:denite_filter_settings() abort
  " Window options
  setlocal signcolumn=yes nocursorline nonumber norelativenumber

  " Disable Deoplete auto-completion within Denite filter window
  if exists('*deoplete#custom#buffer_option')
    call deoplete#custom#buffer_option('auto_complete', v:false)
  endif

  " Denite Filter window key mappings
  imap <silent><buffer> jj          <Plug>(denite_filter_quit)
  nmap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
  imap <silent><buffer> <Esc>       <Plug>(denite_filter_quit)
  nmap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
  imap <silent><buffer> <C-c>       <Plug>(denite_filter_quit)
  inoremap <silent><buffer> <Tab>
        \ <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
  inoremap <silent><buffer> <S-Tab>
        \ <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
endfunction

" Denite general settings
call denite#custom#option('_', {
      \ 'prompt': '❯',
      \ 'auto_resume': 1,
      \ 'start_filter': 1,
      \ 'statusline': 1,
      \ 'smartcase': 1,
      \ 'vertical_preview': 1,
      \ 'max_dynamic_update_candidates': 50000,
      \ })

" Interactive grep search
call denite#custom#var('grep', 'min_interactive_pattern', 2)
call denite#custom#source('grep', 'args', ['', '', '!'])

if has('nvim')
  call denite#custom#option('_', {
        \ 'statusline': 0,
        \ 'split': 'floating',
        \ 'floating_preview': 1,
        \ 'filter_split_direction': 'floating',
        \ })
endif

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

call denite#custom#var('file/rec', 'command',
\ ['ag', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('grep', {
  \ 'command': ['ag'],
  \ 'default_opts': ['--vimgrep', '-i', '--hidden'],
  \ 'recursive_opts': [],
  \ 'pattern_opt': [],
  \ 'final_opts': [],
  \ 'separator': ['--'],
  \ })


" Change default action.
call denite#custom#kind('file', 'default_action', 'tabswitch')

call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <C-x>b :Denite buffer<CR>
nnoremap <C-x>f :Denite file<CR>
