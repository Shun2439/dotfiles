"TeXで表示が修正されるのをなくす
let g:tex_conceal = ""

function! Tex()
    let fname = expand('%:p:r')
    exec "w"
    exec "!platex ".fname.".tex"
    exec "!dvipdfmx ".fname.".dvi"
endfunction

"autocmd BufWritePost *.tex silent! call Tex()

