set encoding=UTF-8

" indent
set sw=4 ts=4

set ai

set cindent

set nu

filetype indent plugin on

syntax on

" spell check
set spelllang=en,cjk

fun! s:SpellConf()
	redir! => syntax
	silent syntax
	redir END

	set spell

	if syntax =~? '/<comment\>'
		syntax spell default
		syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent containedin=Comment contained
	else
		syntax spell toplevel
		syntax match SpellMaybeCode /\<\h\l*[_A-Z]\h\{-}\>/ contains=@NoSpell transparent
	endif

	syntax cluster Spell add=SpellNotAscii,SpellMaybeCode
endfunc

augroup spell_check
	autocmd!
	autocmd BufReadPost,BufNewFile,Syntax * call s:SpellConf()
augroup END

" netrw
" tree形式
let g:netrw_liststyle=3

" ヘッダを非表示にする
let g:netrw_banner=0

" サイズを(K,M,G)で表示する
let g:netrw_sizestyle="H"

" 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"

" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
