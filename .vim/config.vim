"
"indent
"
set sw=4 ts=4

set autoindent

set cindent
"
"
"

"
"
"
set omnifunc=true

filetype indent plugin on

syntax enable

colorscheme torte

"transparent
hi Normal guibg=NONE ctermbg=NONE
"
"
"

"
"netrw
"
"tree形式
let g:netrw_liststyle=3

" ヘッダを非表示にする
let g:netrw_banner=0

" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"

" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1

"起動時にnetrwを表示
"au VimEnter * F
"
"
"
