let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['E%d', 'W%d', 'K']
let g:ale_maximum_file_size = 500000
let g:ale_rust_rls_executable = $HOME . '/.cargo/bin/rls'
let g:ale_go_langserver_executable  = $HOME . '/go/bin/go-langserver'
let g:ale_python_pyls_config = {'pyls': {'plugins': {'pycodestyle': {'enabled': v:false}}}}
"let g:ale_completion_tsserver_autoimport = 1
let g:go_fmt_fail_silently = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_enter = 0
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
"let g:ale_open_list = 1
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
let b:ale_fixers = {
  \  '*': ['remove_trailing_lines', 'trim_whitespace'],
  \  'typescript': ['prettier'],
  \  'javascript': ['prettier'],
  \  'css': ['prettier'],
  \  'python': ['black'],
  \ }
"gofmt golint go vet
  "\ 'rust': ['cargo', 'rls', 'rustc', 'clippy', 'rustfmt'],
let g:ale_linters = {
  \ 'bash': ['language_server', 'shell'],
  \ 'sh': ['shell'],
  \ 'zsh': ['shell'],
  \ 'cpp': ['clang', 'cppcheck'],
  \ 'go': ['golangserver'],
  \ 'javascript': ['eslint', 'tsserver'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'python': ['flake8', 'mypy', 'pyls'],
  \ }
let g:ale_pattern_options = {
\   '.*\.md$': {'ale_enabled': 0},
\   '.*\.markdown$': {'ale_enabled': 0},
\   '.*\.rst$': {'ale_enabled': 0},
\   '.*\.txt$': {'ale_enabled': 0},
\   '.*\.tex$': {'ale_enabled': 0},
\}
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprevious<CR>
nnoremap <leader>r :lrewind<CR>
nnoremap <leader>eo :lopen<CR>
nnoremap <leader>ec :lclose<CR>
highlight ALEErrorSign ctermbg=NONE ctermfg=red guibg=NONE guifg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
nmap <silent> <Leader>n <Plug>(ale_previous_wrap)
nmap <silent> <Leader>e <Plug>(ale_next_wrap)
nmap <leader>= <Plug>(ale_fix)
nmap <leader>- :ALEToggleBuffer<cr>
