setlocal foldmethod=expr
setlocal foldexpr=GetFold(v:lnum)
setlocal foldtext=GetText()

let s:fromnum = -1

function! GetText()
    return '-- '.(v:foldend-v:foldstart).' Headers'
endfunction

function! GetFold(lnum)
    if s:fromnum == -1
        let linepos = 0
        while linepos <= line("$")
            if getline(linepos) =~ '^\(Date\|Subject\|Reply\|To\|From\): '
                let s:fromnum = linepos
                break
            endif
            let linepos = linepos+1
        endwhile
    endif

    if a:lnum < s:fromnum
        return '1'
    else
        return '0'
    endif
endfunction
