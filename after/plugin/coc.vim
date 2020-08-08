augroup vimrc_autocomplete
  autocmd!
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent! call CocActionAsync('highlight')
  autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,javascript,json setl formatexpr=CocAction('formatSelected')

  " close coc-explorer if it is the only buffer open
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  autocmd WinEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  autocmd TabLeave * if (&filetype == 'coc-explorer') | wincmd w | endif

  " open coc-explorer if vim is started with no arg, or arg is a dir
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'CocCommand explorer' | endif
  "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | bd | exe 'CocCommand explorer' argv()[0] | endif
augroup END

nnoremap <silent><Leader>d :CocCommand explorer<CR>

hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A

" \ 'coc-prettier',
let g:coc_global_extensions=[
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-go',
  \ 'coc-jest',
  \ 'coc-tag',
  \ 'coc-vimlsp',
  \ 'coc-spell-checker',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-tsserver',
  \ 'coc-highlight',
  \ 'coc-git',
  \ 'coc-emmet',
  \ 'coc-markdownlint',
  \ 'coc-yank',
  \ 'coc-neosnippet',
  \ 'coc-actions',
  \ 'coc-explorer',
  \ 'coc-pairs',
  \ ]

function s:tab_completion() abort
  if pumvisible()
    return "\<C-n>"
  endif

  if s:check_back_space()
    return "\<TAB>"
  endif

  return coc#refresh()
endfunction

inoremap <silent><expr> <Tab> <sid>tab_completion()
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

snoremap <silent><expr> <Tab>
  \ neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<TAB>"
inoremap <expr> <Esc>
  \ pumvisible() ? "\<C-e>" :
  \ "\<Esc>"
inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <C-d> <Plug>(coc-range-select)
"xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>ad  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>ex  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>


set wildoptions=pum
set wildignore=*.o,*.obj,*~                                                     "stuff to ignore when tab completing
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*mypy_cache*
set wildignore+=*__pycache__*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules*
set wildignore+=**/node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
